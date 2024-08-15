import 'package:flutter/material.dart';

class Q7 extends StatefulWidget {
  const Q7({super.key});
  State<Q7> createState() => _Q7State();
}

class _Q7State extends State<Q7> {
  bool _isChecked = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q7"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isChecked)
              Container(
                child: Text('The World Is Very Beautiful',
                style: TextStyle(fontSize: 20),),
              ),
            Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            if (!_isChecked)
              Container(
                child: Text('Click On CheckBox To Show Text'),
              ),
          ],
        ),
      ),
    );
  }
}
