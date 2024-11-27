import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class Splash2545 extends StatefulWidget {
  _Splash2545State createState() => _Splash2545State();
}

class _Splash2545State extends State<Splash2545> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2 ),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => apnahome()),
      );
    });
  }
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400], // Set background color to green
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: CircleAvatar(
                radius: 50, // Adjust size as needed
                backgroundColor: Colors.grey[800],
                child: Icon(Icons.book, // Substitute with your book icon
                  size: 60,
                  color: Colors.blue[300],
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between icon and text
            const Text(
              "Created by\nSofTonik",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for MainScreen to demonstrate navigation
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Screen")),
      body: Center(child: Text("Welcome to Apnibook!")),
    );
  }
}
