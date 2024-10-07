import 'package:assignment/assessment(sqflite)/repository.dart';
import 'package:flutter/material.dart';
import 'package:assignment/assessment(sqflite)/modelclass.dart';
class AddDonorScreen extends StatefulWidget {
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  String? _selectedBloodGroup;
  TextEditingController _contactController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  final List<String> _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donor Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name field with validation
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Enter Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
              ),

              // Blood group dropdown field with validation
              DropdownButtonFormField<String>(
                value: _selectedBloodGroup,
                decoration: InputDecoration(hintText: 'Select Blood Group'),
                items: _bloodGroups.map((String bloodGroup) {
                  return DropdownMenuItem<String>(
                    value: bloodGroup,
                    child: Text(bloodGroup),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBloodGroup = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please Select A Blood Group';
                  }
                  return null;
                },
              ),

              // Contact number field with validation
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(hintText: 'Enter Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  final RegExp contactRegex = RegExp(r'^[0-9]{10}$');

                  if (value == null || value.isEmpty) {
                    return 'Please Enter Contact Number';
                  } else if (!contactRegex.hasMatch(value)) {
                    return 'Contact Number Must Be Exactly 10 Digits';
                  }
                  return null;
                },
              ),

              // Address field with validation
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(hintText:'Enter Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Address';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('ARE YOU SURE YOU WANT TO ADD THIS DONOR?',
                          style: TextStyle(fontSize: 17),),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Bloodmodel donor = Bloodmodel();
                                Repository repo = Repository();

                                donor.name = _nameController.text;
                                donor.blood_group = _selectedBloodGroup;
                                donor.contact = _contactController.text;
                                donor.location = _locationController.text;
                                repo.insertDonor('Donors', donor.ToMap());
                                Navigator.of(context).pop();
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Donor Added Successfully!')),
                                );
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Add Donor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}