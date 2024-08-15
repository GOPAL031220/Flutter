import 'package:flutter/material.dart';

class Q1_2 extends StatelessWidget {
  const Q1_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/images/a.jpg',)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15),
                child: Text("Oeschinen Lake Switzerland",
                style: TextStyle(fontSize: 22),),
              ),
            ],
          ),
          Row(
            children: [
              Text('     Kandersteg, Switzerland                                         '),
              Icon(Icons.star,
              color: Colors.red,),
              Text('41')
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.call,color: Colors.blueAccent,),
                  Text('CALL',style: TextStyle(color: Colors.blueAccent),),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.route_sharp,color: Colors.blueAccent,),
                  Text('CALL',style: TextStyle(color: Colors.blueAccent),),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share,color: Colors.blueAccent,),
                  Text('CALL',style: TextStyle(color: Colors.blueAccent),),
                ],
              )
            ],
          ),
          
          Container(
            margin: EdgeInsets.only(top: 25,left: 12,right: 12),
            child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
            style: TextStyle(fontSize: 16),),
          )
        ],
      ),
    );
  }
}
