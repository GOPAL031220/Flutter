import 'package:flutter/material.dart';

class AlertDialogExample extends StatefulWidget {
  @override
  _AlertDialogExampleState createState() => _AlertDialogExampleState();
}

class _AlertDialogExampleState extends State<AlertDialogExample> {
  String _result = '';

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Example'),
          content: Text('Please choose an option'),
          actions: [
            TextButton(
              child: Text('Positive'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _result = 'You chose the positive option!';
                });
              },
            ),
            TextButton(
              child: Text('Negative'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _result = 'You chose the negative option!';
                });
              },
            ),
            TextButton(
              child: Text('Neutral'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _result = 'You chose the neutral option!';
                });
              },
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
        title: Text('Alert Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Show Alert Dialog'),
              onPressed: _showAlertDialog,
            ),
          ],
        ),
      ),
    );
  }
}