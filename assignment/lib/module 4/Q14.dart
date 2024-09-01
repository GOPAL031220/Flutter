import 'package:flutter/material.dart';

class SimpleAlertDialogExample extends StatefulWidget {
  @override
  _SimpleAlertDialogExampleState createState() => _SimpleAlertDialogExampleState();
}

class _SimpleAlertDialogExampleState extends State<SimpleAlertDialogExample> {
  void _showSimpleAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Simple Alert Dialog'),
          icon: Icon(Icons.info),
          content: Text('This is a simple alert dialog with a title, description, and icon.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Alert Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Simple Alert Dialog'),
          onPressed: _showSimpleAlertDialog,
        ),
      ),
    );
  }
}