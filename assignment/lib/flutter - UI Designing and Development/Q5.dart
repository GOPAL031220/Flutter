import 'package:flutter/material.dart';

class Q5 extends StatefulWidget {
  const Q5({super.key});

  @override
  State<Q5> createState() => _Q5();
}

class _Q5 extends State<Q5> {
  List<Color> _colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];
  int _index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Q5"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: _colors[_index],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index = (_index + 1) % _colors.length;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
