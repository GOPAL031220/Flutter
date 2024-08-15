import 'package:flutter/material.dart';

class Q4 extends StatefulWidget {
  const Q4({super.key});

  @override
  State<Q4> createState() => _Q4State();
}

class _Q4State extends State<Q4> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  double _result=0;
  int _value = 1;
  bool _isVisible = false;

  void _handleRadioValueChange(value) {
    double  num1 = double.parse(n1.text);
    double  num2 = double.parse(n2.text);

    setState(() {
      _value = value!;
      switch (_value) {
        case 1:
          _result =num1+num2;
          break;
        case 2:
          _result =num1-num2;
          break;
        case 3:
          _result =num1*num2;
          break;
        case 4:
          _result =num1/num2;
          break;
      }
    });
    _result.toString();
    _isVisible=true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Q4"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45,right: 45),
            child: Row(
              children: [
                Radio(value: 1,
                    groupValue: _value,
                    onChanged:_handleRadioValueChange,
                  activeColor: Colors.cyan,
                ),Text('Addition'),

                SizedBox(width:70,),

                Radio(value: 2,
                  groupValue: _value,
                  onChanged: _handleRadioValueChange,
                  activeColor: Colors.cyan,
                ),Text('Substraction'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 45,right: 45,bottom: 30),
            child: Row(
              children: [
                Radio(value: 3,
                  groupValue: _value,
                  onChanged: _handleRadioValueChange,
                  activeColor: Colors.cyan,
                ),Text('Multiplication'),

                SizedBox(width: 36.5,),

                Radio(value: 4,
                  groupValue: _value,
                  onChanged: _handleRadioValueChange,
                  activeColor: Colors.cyan,
                ),Text('Division'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: n1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Number 1',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: n2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Number 2',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
            ),
          ),
          ElevatedButton(onPressed:(){
            setState(() {
              _handleRadioValueChange(_value);
            });
          }, child: Text("Calculate",
          style: TextStyle(color: Colors.blue,fontSize: 20),)),

          SizedBox(height: 12,),
          Visibility(visible: _isVisible,
            child:Text('Result: $_result',
            style: TextStyle(fontSize: 20),
          ), )
        ],
      ),
    );
  }
}