import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telegram/sign_in_screen.dart';
import 'package:telegram/user_list.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool flag = true;
  bool progress = false;

  Color common = Color(0xFF639BF6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/images/userlogin.png',
              //   height: 160,
              //   width: 160,
              // ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: email,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                cursorHeight: 16,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter mail',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 14,
              ),
              TextField(
                controller: password,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                cursorColor: Colors.black,
                cursorHeight: 16,
                obscureText: flag,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter password',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        icon: Icon(
                            flag ? Icons.visibility_off : Icons.visibility))),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: common),
                  child: progress
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () {
                  setState(() {
                    progress = true;
                  });
                  if (email.text.toString().isNotEmpty &&
                      password.text.toString().isNotEmpty) {
                    signInWithEmail(email.text.toString().trim(),
                        password.text.toString().trim());
                  } else {
                    setState(() {
                      progress = false;
                    });
                    Fluttertoast.showToast(
                        msg: 'Please fill the fields',
                        backgroundColor: common,
                        textColor: Colors.white,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT);
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    TextSpan(text: ' Sign up',style: TextStyle(fontSize: 18,color: Colors.black),recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                    }),
                  ]
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      // Try signing in with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((onValue) {
        setState(() {
          progress = false;
        });

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UserList(),
            ));
        return onValue;
      });

      User? user = userCredential.user;
      if (user != null) {
        print("Successfully signed in: ${user.email}");
      } else {
        print("No user found");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        progress = false;
      });
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            backgroundColor: common,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT);
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: 'Wrong password provided for that user.',
            backgroundColor: common,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT);
        print('Wrong password provided for that user.');
      } else {
        Fluttertoast.showToast(
            msg: '${e.message}',
            backgroundColor: common,
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
