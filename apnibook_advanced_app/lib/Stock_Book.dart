import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StockBook extends StatefulWidget {
  const StockBook({super.key});

  @override
  State<StockBook> createState() => _StockBookState();
}

class _StockBookState extends State<StockBook> {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  addOrUpdateStockData(String documentId, String itemName, String quantity) async {
    FirebaseFirestore.instance.collection("Stock").doc(documentId).set({
      "ItemName": itemName,
      "Quantity": int.parse(quantity),
    });
  }

  // Function to delete stock data
  deleteStockData(String documentId) async {
    FirebaseFirestore.instance.collection("Stock").doc(documentId).delete();
  }

  // Show form dialog for add or update
  _showFormDialog(BuildContext context, {String? documentId, String? itemName, String? quantity}) {
    if (itemName != null && quantity != null) {
      _itemNameController.text = itemName;
      _quantityController.text = quantity;
    } else {
      _itemNameController.clear();
      _quantityController.clear();
    }

    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          actions: [
            OutlinedButton(
              onPressed: () {
                String newDocumentId = documentId ?? _itemNameController.text.trim();
                addOrUpdateStockData(
                  newDocumentId,
                  _itemNameController.text.trim(),
                  _quantityController.text.trim(),
                );
                Navigator.pop(context);
                _itemNameController.clear();
                _quantityController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(documentId == null ? 'Item Added!' : 'Item Updated!')),
                );
              },
              child: Text(
                documentId == null ? 'Add' : 'Update',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                _itemNameController.clear();
                _quantityController.clear();
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
          title: Text(documentId == null ? 'Add Stock' : 'Update Stock'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _itemNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Item Name',
                  ),
                ),
                TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Quantity',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _showDeleteConfirmationDialog(BuildContext context, String documentId, String itemName) {
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete "$itemName"?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                deleteStockData(documentId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item Deleted!')),
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
        title: const Text('Stock Book'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Stock").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              var docs = snapshot.data!.docs;
              return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  var stockItem = docs[index];
                  return GestureDetector(
                    onTap: () {
                      _showFormDialog(
                        context,
                        documentId: stockItem.id,
                        itemName: stockItem["ItemName"],
                        quantity: stockItem["Quantity"].toString(),
                      );
                    },
                    onLongPress: () {
                      _showDeleteConfirmationDialog(
                        context,
                        stockItem.id,
                        stockItem["ItemName"],
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/g.jpg",
                            height: 50,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stockItem["ItemName"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stockItem["Quantity"].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        ],
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
