import 'package:flutter/material.dart';
import 'package:assignment/assessment(sqflite)/add_donor_screen.dart';
import 'package:assignment/assessment(sqflite)/Donorlist.dart';
import 'package:assignment/assessment(sqflite)/Request Recieved.dart';



class Adminscreen extends StatelessWidget {
  const Adminscreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Functions'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
             _buildGridItem(context, 'Add Donor', Icons.person_add, AddDonorScreen()),
             _buildGridItem(context, 'Donors List', Icons.person, Donorlist()),
             _buildGridItem(context, 'Request Received', Icons.assignment, Requestlist()),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Card(
        elevation: 5,
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


