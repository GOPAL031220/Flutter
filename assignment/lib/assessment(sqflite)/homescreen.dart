import 'dart:math';

import 'package:flutter/material.dart';
import 'package:assignment/assessment(sqflite)/Blood Request.dart';
import 'package:assignment/assessment(sqflite)/Search_donor.dart';
import 'package:assignment/assessment(sqflite)/adminscreen.dart';

class firstscreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Hub'),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
             // CallHelper.makeEmergencyCall(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Gopalsingh Kushwah',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              accountEmail: Text('flutter@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/a.jpg'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Admin Functions'),
              trailing: Icon(Icons.lock),
              onTap: () {
                final _formKey = GlobalKey<FormState>();
                TextEditingController _passwordController = TextEditingController();

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Enter Password'),
                      content: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Password (admin123)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';}

                            if (value != 'admin123') {
                              return 'Incorrect Password';}
                            return null;
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Adminscreen()));
                            }
                          },
                          child: Text('Open'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildGridItem(context, 'Blood Request', Icons.question_answer, BloodRequestScreen()),
            _buildGridItem(context, 'Search Donors', Icons.search, SearchDonorScreen()),
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

