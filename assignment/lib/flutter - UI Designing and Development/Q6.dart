import 'package:flutter/material.dart';

class Q6 extends StatefulWidget {
  const Q6({super.key});

  State<Q6> createState() => _Q6State();
}

class _Q6State extends State<Q6> {
  double _fontSize = 15;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 1;
      if(_fontSize > 35) {
        _fontSize = 35;
      }
    });
  }
  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 1;
      if(_fontSize < 15) {
        _fontSize = 15;
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Hello World',
              style: TextStyle(fontSize: _fontSize),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.green,
                    iconSize: 50,
                    onPressed: _increaseFontSize,
                  ),
                  IconButton(
                    icon: Icon(Icons.remove,),
                    color: Colors.red,
                    iconSize: 50,
                    onPressed: _decreaseFontSize,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
