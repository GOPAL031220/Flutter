import 'package:flutter/material.dart';

// First activity
class FirstActivity extends StatefulWidget {
  @override
  _FirstActivityState createState() => _FirstActivityState();
}

class _FirstActivityState extends State<FirstActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Activity'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Activity'),
          onPressed: () {
            // Navigate to second activity when button is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondActivity()),
            );
          },
        ),
      ),
    );
  }
}

// Second activity
class SecondActivity extends StatefulWidget {
  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Activity'),
      ),
      body: Center(
        child: Text('You are now in the second activity!'),
      ),
    );
  }
}



