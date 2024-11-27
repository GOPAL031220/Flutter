import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessBook extends StatefulWidget {
  const BusinessBook({super.key});

  @override
  State<BusinessBook> createState() => _BusinessBookState();
}

class _BusinessBookState extends State<BusinessBook> {
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _revenueController = TextEditingController();

  // Add Business Data to Firestore
  Future<void> addBusinessData(String businessName, String category, String revenue) async {
    await FirebaseFirestore.instance.collection("Businesses").add({
      "BusinessName": businessName,
      "Category": category,
      "Revenue": int.parse(revenue),
    });
  }

  // Show Form Dialog to Add Business
  void _showFormDialog(BuildContext context) {
    _businessNameController.clear();
    _categoryController.clear();
    _revenueController.clear();

    showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text('Add Business'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _businessNameController,
                  decoration: const InputDecoration(hintText: 'Enter Business Name'),
                ),
                TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(hintText: 'Enter Category'),
                ),
                TextField(
                  controller: _revenueController,
                  decoration: const InputDecoration(hintText: 'Enter Revenue'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                if (_businessNameController.text.isNotEmpty &&
                    _categoryController.text.isNotEmpty &&
                    _revenueController.text.isNotEmpty) {
                  addBusinessData(
                    _businessNameController.text.trim(),
                    _categoryController.text.trim(),
                    _revenueController.text.trim(),
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Business Added!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields!')),
                  );
                }
              },
              child: const Text('Add', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
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
        title: const Text('Business Book'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Businesses").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  var business = docs[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        business["BusinessName"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Category: ${business["Category"]}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      trailing: Text(
                        'Revenue: ₹${business["Revenue"]}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
