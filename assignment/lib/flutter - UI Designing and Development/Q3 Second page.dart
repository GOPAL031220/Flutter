import 'package:flutter/material.dart';

class NumberRangeScreen extends StatelessWidget {
   int? startNumber;
   int? endNumber;

  NumberRangeScreen({ this.startNumber,this.endNumber});

  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = startNumber!+1; i < endNumber!; i++) {
      numbers.add(i);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers Between $startNumber and $endNumber'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${numbers[index]}'),
            );
          },
        ),
      ),
    );
  }
}