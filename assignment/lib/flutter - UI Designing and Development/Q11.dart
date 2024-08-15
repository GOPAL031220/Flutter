import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Q11(S2).dart';

class Q11 extends StatefulWidget {
  const Q11({super.key});

  State<Q11> createState() => _Q11State();
}

class _Q11State extends State<Q11> {
  bool _hideText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100),

            TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black,fontSize: 22),
              decoration: InputDecoration(
                hintText: "Enter e-mail Id",
                hintStyle: TextStyle(color: Colors.black),

                filled: true,
                fillColor: Colors.white.withOpacity(0.99999),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.mail,
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
                hintText: 'Enter Password',
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
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(fontSize: 17)
                      ),
                      TextSpan(
                        text: "Create Account",
                        style: TextStyle(fontSize: 25,color: Colors.lime),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Question11(),
                            ));
                          },
                      ),
                    ])),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}

