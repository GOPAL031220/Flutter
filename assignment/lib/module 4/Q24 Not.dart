import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hasPermission = false;

  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    final status = await Permission.phone.request();
    if (status == PermissionStatus.granted) {
      setState(() {
        _hasPermission = true;
      });
    } else {
      setState(() {
        _hasPermission = false;
      });
    }
  }

  Widget build(BuildContext context) {
    if (!_hasPermission) {
      return _requestPermissionDialog();
    } else {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Phone Call App'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                // Make a phone call
                // ...
              },
              child: Text('Make a Call'),
            ),
          ),
        ),
      );
    }
  }

  Widget _requestPermissionDialog() {
    return AlertDialog(
      title: Text('Permission Required'),
      content: Text('This app needs permission to make phone calls.'),
      actions: [
        ElevatedButton(
          onPressed: () {
            _requestPermission();
          },
          child: Text('Allow'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Deny'),
        ),
      ],
    );
  }
}