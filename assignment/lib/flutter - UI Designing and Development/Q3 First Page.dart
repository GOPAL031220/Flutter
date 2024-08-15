import 'package:flutter/material.dart';
import 'Q3 Second page.dart';

class Q3 extends StatefulWidget {
  const Q3({super.key});

  State<Q3> createState() => _Q3State();
}

class _Q3State extends State<Q3> {

  var _formKey = GlobalKey<FormState>();
  TextEditingController _startController = TextEditingController();
  TextEditingController _endController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q3'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Enter Two Numbers',
              style: (TextStyle(fontSize: 25,)),),

              SizedBox(height: 10),

              TextFormField(
                controller: _startController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Start Number'),
                validator: (value) {

                  int? numa = int.tryParse(value!);
                  if(numa==null){
                    return'Entered Number Is Invalid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _endController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter End Number'),
                validator: (value) {
                  int? numb = int.tryParse(value!);
                  if(numb==null){
                    return'Entered Number Is Invalid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int startNumber = int.parse(_startController.text);
                    int endNumber = int.parse(_endController.text);
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => NumberRangeScreen(
                          startNumber: startNumber,
                          endNumber: endNumber,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Show Between Numbers',
                style: TextStyle(color: Colors.blueAccent),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
