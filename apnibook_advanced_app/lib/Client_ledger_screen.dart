import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientLedgerScreen extends StatelessWidget {
  final String clientName;

  const ClientLedgerScreen({required this.clientName, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _amountController = TextEditingController();

    addLedgerEntry(String type, String amount) async {
      FirebaseFirestore.instance
          .collection("Clients")
          .doc(clientName)
          .collection("Ledger")
          .add({
        "Type": type,
        "Amount": amount,
        "Date": DateTime.now(),
      });
    }

    _showAddEntryDialog(BuildContext context, String type) {
      showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Add $type Entry"),
            content: TextField(
              controller: _amountController,
              decoration: const InputDecoration(hintText: "Enter Amount"),
              keyboardType: TextInputType.number,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  addLedgerEntry(type, _amountController.text.trim());
                  Navigator.pop(context);
                  _amountController.clear();
                },
                child: const Text("Add"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _amountController.clear();
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        toolbarHeight: 90,
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/a.jpg"), // Add path later
            ),
            const SizedBox(height: 8),
            Text("   ${clientName}", style: const TextStyle(fontSize: 18)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Totals Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.green.shade100,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Clients")
                  .doc(clientName)
                  .collection("Ledger")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    var docs = snapshot.data!.docs;
                    int totalReceived = 0;
                    int totalPaid = 0;

                    for (var doc in docs) {
                      if (doc["Type"] == "Received") {
                        totalReceived += int.parse(doc["Amount"]);
                      } else if (doc["Type"] == "Paid") {
                        totalPaid += int.parse(doc["Amount"]);
                      }
                    }

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTotalCard(
                          "TOTAL RECEIVED",
                          totalReceived.toString(),
                          Colors.green,
                        ),
                        _buildTotalCard(
                          "TOTAL PAID",
                          totalPaid.toString(),
                          Colors.red,
                        ),
                        _buildTotalCard(
                          "YOU WILL GET",
                          (totalPaid - totalReceived).toString(),
                          Colors.blue,
                        ),
                      ],
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ),

          Row(
            children: [
              Text('          Date & Time                                   Received                  Paid'),
            ],
          ),

          // Ledger Entries
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Clients")
                  .doc(clientName)
                  .collection("Ledger")
                  .orderBy("Date", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    var docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        var doc = docs[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.green.shade50
                                : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateTime.parse(doc["Date"].toDate().toString())
                                    .toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                doc["Type"] == "Received"
                                    ? doc["Amount"]
                                    : "",
                                style: const TextStyle(color: Colors.green),
                              ),
                              Text(
                                doc["Type"] == "Paid" ? doc["Amount"] : "",
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      // Bottom Buttons
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              _showAddEntryDialog(context, "Paid");
            },
            label: const Text("PAID"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _showAddEntryDialog(context, "Received");
            },
            label: const Text("RECEIVED"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard(String title, String amount, Color color) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
