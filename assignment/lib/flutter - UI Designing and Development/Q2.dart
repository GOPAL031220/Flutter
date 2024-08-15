import 'package:flutter/material.dart';

class q2 extends StatefulWidget {
  const q2({super.key});

  @override
  State<q2> createState() => _q2State();
}

class _q2State extends State<q2> {

  TextEditingController _num = TextEditingController();
  String? _a;

  void _reverseNumber() {
    String input = _num.text;
    String reversed = input.split('').reversed.join('');
    setState(() {
      _a = reversed;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Q2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Your Number'
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _reverseNumber,
              child: Text('Reverse Number',
              style: TextStyle(color: Colors.blueAccent),),
            ),
            SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _a,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }
