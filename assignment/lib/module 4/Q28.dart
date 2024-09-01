import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _num1Controller = TextEditingController();
  final _num2Controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Number 1',
                border: OutlineInputBorder()),
                controller: _num1Controller,
                validator: (value) {
                  num? numb = num.tryParse(value!);
                  if (numb ==null) {
                    return 'Please Enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Number 2',
                border: OutlineInputBorder()),
                controller: _num2Controller,
                validator: (value) {
                  num? numb = num.tryParse(value!);
                  if (numb ==null) {
                    return 'Please Enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          num1: double.parse(_num1Controller.text),
                          num2: double.parse(_num2Controller.text),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Calculate Sum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double num1;
  final double num2;

  ResultPage({required this.num1, required this.num2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Text(
          'The sum is: ${num1 + num2}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}