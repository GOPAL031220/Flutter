import 'package:flutter/material.dart';

class Question11 extends StatefulWidget {
  const Question11({super.key});

  State<Question11> createState() => _Question11State();
}

class _Question11State extends State<Question11> {
  bool _hideText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black,fontSize: 22),
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.99999),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon:Icon(Icons.perm_identity,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black,fontSize: 22),
                decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.99999),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon:Icon(Icons.email,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(color: Colors.black,fontSize: 22),
                obscureText: _hideText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),

                  filled: true,
                  fillColor: Colors.white.withOpacity(0.99999),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hideText = !_hideText;
                      });
                    },
                    icon: Icon(Icons.visibility,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

