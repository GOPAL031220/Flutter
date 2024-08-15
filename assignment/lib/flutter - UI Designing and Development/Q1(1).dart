import 'package:flutter/material.dart';

class Q1 extends StatelessWidget {
  const Q1({super.key});
  
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
         Container(
           height: 200,
           width: double.infinity,
           color: Colors.red,
           margin: EdgeInsets.only(top: 30,bottom: 10,left: 10,right: 10),
         ),

          Row(
            children: [
              Container(
                height: 190.5,
                width: 190.5,
                color: Colors.blue,
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              ),
              Container(
                height: 190.5,
                width: 190.5,
                color: Colors.blue,
                margin: EdgeInsets.only(right: 10,bottom: 10),
              )
            ],
          ),

          Row(
            children: [
              Container(
                height: 190.5,
                width: 190.5,
                color: Colors.blue,
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              ),
              Container(
                height: 190.5,
                width: 190.5,
                color: Colors.blue,
                margin: EdgeInsets.only(right: 10,bottom: 10),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 124,
                width: 124,
                color: Colors.yellow,
                margin: EdgeInsets.only(left: 10,bottom: 10),
              ),

              Container(
                height: 124,
                width: 124,
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 10),
              ),

              Container(
                height: 124,
                width: 124,
                color: Colors.yellow,
                margin: EdgeInsets.only(right: 10,bottom: 10),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 105,
                width: 124,
                color: Colors.yellow,
                margin: EdgeInsets.only(left: 10),
              ),

              Container(
                height: 105,
                width: 124,
                color: Colors.yellow,
              ),

              Container(
                height: 105,
                width: 124,
                color: Colors.yellow,
                margin: EdgeInsets.only(right: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
