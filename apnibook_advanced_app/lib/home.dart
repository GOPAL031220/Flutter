import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Business_Book.dart';
import 'Client_Book.dart';
import 'Expense_Book.dart';
import 'Stock_Book.dart';

class apnahome extends StatefulWidget {
  const apnahome({super.key});
  State<apnahome> createState() => _apnahomeState();
}

class _apnahomeState extends State<apnahome> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apnibook',style: TextStyle(fontSize: 25),),
      backgroundColor: Colors.green,),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0,
          children: [
            _buildGridItem(context, 'Client Book', Icons.person, ClientBook()),
            _buildGridItem(context, 'Business Book', Icons.business_center, BusinessBook()),
            _buildGridItem(context, 'Stock Book', Icons.inventory, StockBook()),
            _buildGridItem(context, 'Expense Book', Icons.account_balance_wallet, ExpenseBook()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Help'),
              content: Text(
                'Welcome to Apnibook!\n\nThis app helps you manage your:\n'
                    '1. Client Book: Manage your clients and their details.\n'
                    '2. Business Book: Track all your business transactions and records.\n'
                    '3. Stock Book: Keep an inventory of your stock and supplies.\n'
                    '4. Expense Book: Manage your expenses efficiently.\n\n'
                    'For detailed instructions, select a section to proceed.',
              style: TextStyle(fontSize: 20),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.help_outline),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
