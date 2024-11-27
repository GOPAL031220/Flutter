import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Client_ledger_screen.dart';

class ClientBook extends StatefulWidget {
  const ClientBook({super.key});

  @override
  State<ClientBook> createState() => _ClientBookState();
}

class _ClientBookState extends State<ClientBook> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  addOrUpdateClientData(String documentId, String name, String number) async {
    FirebaseFirestore.instance.collection("Clients").doc(documentId).set({
      "Name": name,
      "Number": number,
    });
  }

  deleteClientData(String documentId) async {
    FirebaseFirestore.instance.collection("Clients").doc(documentId).delete();
  }

  _showFormDialog(BuildContext context, {String? documentId, String? name, String? number}) {
    if (name != null && number != null) {
      _nameController.text = name;
      _numberController.text = number;
    } else {
      _nameController.clear();
      _numberController.clear();
    }

    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          actions: [
            OutlinedButton(
              onPressed: () {
                String newDocumentId = documentId ?? _nameController.text.trim();
                addOrUpdateClientData(
                  newDocumentId,
                  _nameController.text.trim(),
                  _numberController.text.trim(),
                );
                Navigator.pop(context);
                _nameController.clear();
                _numberController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(documentId == null ? 'Client Added!' : 'Client Updated!')),
                );
              },
              child: Text(
                documentId == null ? 'Add' : 'Update',
                style: const TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                _nameController.clear();
                _numberController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ],
          title: Text(documentId == null ? 'Add Client' : 'Update Client'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Name',
                  ),
                ),
                TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDeleteConfirmationDialog(BuildContext context, String documentId, String name) {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete "$name"?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                deleteClientData(documentId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Client Deleted!')),
                );
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Book'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Clients").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  var client = docs[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        client["Name"],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Text(client["Number"]),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Update') {
                            _showFormDialog(
                              context,
                              documentId: client.id,
                              name: client["Name"],
                              number: client["Number"],
                            );
                          } else if (value == 'Delete') {
                            _showDeleteConfirmationDialog(context, client.id, client["Name"]);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: 'Update', child: Text('Update')),
                          const PopupMenuItem(value: 'Delete', child: Text('Delete')),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientLedgerScreen(clientName: client["Name"]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
