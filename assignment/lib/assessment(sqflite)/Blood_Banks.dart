import 'package:flutter/material.dart';
class BloodBanks extends StatefulWidget {
  const BloodBanks({super.key});

  State<BloodBanks> createState() => _BloodBanksState();
}

class _BloodBanksState extends State<BloodBanks> {
  List<Map<String, dynamic>> _bloodBanks = [
    {'name': 'Red Cross Blood Bank', 'contact': '7885412356', 'location': 'Ahmedabad'},
    {'name': 'City Hospital Blood Bank', 'contact': '7485962312', 'location': 'Mumbai'},
    {'name': 'Metro Blood Donation Center', 'contact': '9874563214', 'location': 'Delhi'},
    {'name': 'Sunrise Blood Bank', 'contact': '8745632145', 'location': 'Chennai'},
    {'name': 'Apollo Blood Bank', 'contact': '7845123698', 'location': 'Hyderabad'},
    {'name': 'Lifeline Blood Bank', 'contact': '6587451236', 'location': 'Kolkata'},
    {'name': 'Noble Blood Bank', 'contact': '7894561230', 'location': 'Bangalore'},
    {'name': 'Hope Blood Bank', 'contact': '9541236789', 'location': 'Pune'},
    {'name': 'Unity Blood Bank', 'contact': '8965471235', 'location': 'Jaipur'},
    {'name': 'Care Blood Bank', 'contact': '7845962315', 'location': 'Lucknow'},
    {'name': 'Trust Blood Bank', 'contact': '7532148965', 'location': 'Bhopal'},
    {'name': 'MedLife Blood Bank', 'contact': '7896541235', 'location': 'Patna'},
    {'name': 'Global Blood Bank', 'contact': '8523697412', 'location': 'Surat'},
    {'name': 'Sanjeevani Blood Bank', 'contact': '9845632147', 'location': 'Nagpur'},
    {'name': 'Good Health Blood Bank', 'contact': '7412365987', 'location': 'Indore'},
    {'name': 'LifeCare Blood Bank', 'contact': '6589741253', 'location': 'Vadodara'},
    {'name': 'Healing Hands Blood Bank', 'contact': '7896541258', 'location': 'Rajkot'},
    {'name': 'Relief Blood Bank', 'contact': '9874561238', 'location': 'Coimbatore'},
    {'name': 'Saviour Blood Bank', 'contact': '7412589632', 'location': 'Thane'},
    {'name': 'Mission Blood Bank', 'contact': '8521479635', 'location': 'Chandigarh'},
    {'name': 'Angel Blood Bank', 'contact': '9632587412', 'location': 'Nashik'},
    {'name': 'Bright Blood Bank', 'contact': '7896523147', 'location': 'Faridabad'},
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Banks'),),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.0,left: 10.0,right: 10.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                title: Text(_bloodBanks[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                subtitle: Row(
                  children: [
                    Text(_bloodBanks[index]['contact']),
                    SizedBox(width: 10),
                    Text(_bloodBanks[index]['location']),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _bloodBanks.length,
      ),
    );
  }
}

