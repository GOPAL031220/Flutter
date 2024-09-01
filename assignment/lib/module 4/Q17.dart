import 'package:flutter/material.dart';

class ExitAlertDialog extends StatefulWidget {
  @override
  _ExitAlertDialogState createState() => _ExitAlertDialogState();
}

class _ExitAlertDialogState extends State<ExitAlertDialog> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the application?'),
        actions: [
          TextButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Alert Dialog'),
        ),
        body: Center(
          child: Text('Press back button to exit'),
        ),
      ),
    );
  }
}