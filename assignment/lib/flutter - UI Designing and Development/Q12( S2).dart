import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: double.infinity,
            width: double.infinity,
            color: Colors.orange,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 37,left: 17),
                child: Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 37,right:17),
                child: Container(
                  height: 50, width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Icon(Icons.favorite_border_outlined),
                ),
              ),
            ],
          ),
          Positioned(
            top: 250,
            child: Container(
              width: 415,
              height: 700,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
            ),
          ),
          Positioned(
              top: 180, left: 135,
              child: Container(
                height: 150, width: 150,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/c.jpg',
                  ),
                ),
              )),
          Positioned(
            top: 355, left: 100,
            child: Column(
              children: [
                Text('Sei Ua Samun Phrai',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.access_time,
                      color: Colors.blue),
                    Text(" 50min"),
                    SizedBox(width: 20),

                    Icon(Icons.star,
                      color: Colors.yellow),
                    Text("4.8"),
                    SizedBox(width: 20),

                    Icon(
                      Icons.local_fire_department,
                      color: Colors.red),
                    Text('325 Kcal')
                  ],
                ),
                SizedBox(height: 38),

                Container(
                  height: 40, width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      SizedBox(width: 7),
                      Text('s12',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 7),

                      Container(
                        height: double.infinity,
                        width: 102,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(70)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.remove),

                            Container(
                              height: 30, width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Center(
                                child: Text("1",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 530, left: 25,
            child: Text("Ingredients",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 570, left: 24,
            child: Row(
              children: [
                Container(
                  height: 80, width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Image.asset("assets/images/e.jpg",
                          height: 30,
                        ),
                      ),
                      Text("Noodle"),
                    ],
                  ),
                ),
                SizedBox(width: 26),

                Container(
                  height: 80, width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset("assets/images/f.jpg",
                          height: 35,
                        ),
                      ),
                      Text("Shrimp"),
                    ],
                  ),
                ),
                SizedBox(width: 26),

                Container(
                  height: 80, width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Image.asset("assets/images/g.jpg",
                          height: 35,
                        ),
                      ),
                      Text("Egg"),
                    ],
                  ),
                ),
                SizedBox(width: 26),

                Container(
                  height: 80, width: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Image.asset("assets/images/h.jpg",
                          height: 35,
                        ),
                      ),
                      Text("Scallion"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 680, left: 25,
              child: Text("About",
                style: TextStyle(fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: 720, left: 25,
              child: Text(
                "The foods are made with good quality ingredients and\n make with healthy contents of veges and fruits enjoy\n your dish.",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.black),
              onPressed: () {},
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text('1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
