import 'package:flutter/material.dart';

class test25 extends StatefulWidget {
  const test25({super.key});

  @override
  State<test25> createState() => _test25State();
}

class _test25State extends State<test25> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training'),
        actions: [Row(
          children: [
            Icon(Icons.arrow_left),
            SizedBox(width: 10,),
            Icon(Icons.date_range),
            SizedBox(width: 10,),
            Text('29 April',
              style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(width: 10,),
            Icon(Icons.arrow_right),
            SizedBox(width: 10,),
          ],
        )],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Your progress',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                Text('Details',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Icon(Icons.arrow_forward)
              ],
            ),
            SizedBox(height: 12,),
            Container(
              height: 200, width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next Workout \nLegs Workout \nand Glutes Workout',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.white, fontSize: 20),),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.white,),
                        Text(' 48 Min',
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,),),
                        Spacer(),
                        Icon(Icons.play_circle, size: 35, color: Colors.white,),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity, height: 150,
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: Row(
                  children: [
                    Image.asset('assets/images/Travaling Girl.png',
                      height: 110,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("You are doing great",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue.shade400,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text("Time : 1 min",
                            style: TextStyle(fontSize: 14),
                          ),
                          const Text("you have burnt lot of calories",
                              style: TextStyle(fontSize: 14))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("  Area of Focus",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Image.asset('assets/images/Bodybuilder.png',
                                height: 100,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Biceps",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
