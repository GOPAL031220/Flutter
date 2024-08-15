import 'package:flutter/material.dart';

class Q8 extends StatefulWidget {
  const Q8({super.key});

  State<Q8> createState() => _Q8State();
}

class _Q8State extends State<Q8> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Q8"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/a.jpg',
                  height: 150,
                  width: 150,
                ),
                SizedBox(width: 20),
                Image.asset(
                  'assets/images/a.jpg',
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Images around text",
            style: TextStyle(fontSize: 25),),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/a.jpg',
                    height: 150, width: 150),
                SizedBox(
                  width: 20,
                ),
                Image.asset('assets/images/a.jpg',
                    height: 150, width: 150),
              ],
            )
          ],
        ),
      ),
    );
  }
}


