import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:11),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100, width: 50,
                  child: Icon(Icons.arrow_back)
                ),
                Container(
                  height: 100, width: 50,
                  child: Icon(Icons.search_rounded)
                ),
              ],
            ),
            ListTile(
              minTileHeight: 85,
              title: Text('Restaurant',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Container(
                    height: 25,
                    child: Text(' 20-30mm ',
                      style: TextStyle(fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(2.5)),
                  ),
                  Text('   2.4km  Restaurant',
                    style: TextStyle(color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Container(
                height: 60,width: 60,
                child: Center(
                  child: Text('R',
                    style: TextStyle(fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              children: [
                Text('    Orange Sandwitches is delicious                         ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Icon(Icons.star_border,
                  color: Colors.orange,
                ),
                Text('4.7',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 30,),

            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 40, width: 120,
                    child: Center(
                        child: Text("Recommend",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(width: 10),

                  Container(
                    height: 40, width: 100,
                    child: Center(
                        child: Text("Popular",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(width: 10),

                  Container(
                    height: 40, width: 100,
                    child: Center(
                        child: Text("Noodles",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(width: 10),

                  Container(
                    height: 40, width: 100,
                    child: Center(
                        child: Text("Pizzas",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            Card(
              child: Container( height: 120, width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Row(
                  children: [
                   Padding(
                     padding: const EdgeInsets.all(11.0),
                     child: CircleAvatar(radius: 50,
                       backgroundImage: AssetImage("assets/images/b.jpg"),
                     ),
                   ),
                    Padding(
                      padding:EdgeInsets.only(left: 14,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Soba Soup",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("No.1 in Sales",
                            style: TextStyle(fontWeight: FontWeight.w400,
                                color: Colors.orange),
                          ),
                          Text(
                            "s12",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110,bottom: 50),
                      child: Icon(Icons.chevron_right,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Container( height: 120, width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: CircleAvatar(radius: 50,
                        backgroundImage: AssetImage("assets/images/c.jpg"),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 14,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sei Ua Samun Phrai",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("No.1 in Sales",
                            style: TextStyle(fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            "s12",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 38,bottom: 50),
                      child: Icon(Icons.chevron_right,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              child: Container( height: 120, width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: CircleAvatar(radius: 50,
                        backgroundImage: AssetImage("assets/images/d.jpg"),
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 14,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ratatoullie Pasta",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("No.1 in Sales",
                            style: TextStyle(fontWeight: FontWeight.w400,
                                color: Colors.orange),
                          ),
                          Text(
                            "s12",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 62,bottom: 50),
                      child: Icon(Icons.chevron_right,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 140),

            Row(
              children: [
                Container(
                  height: 20, width: 20,
                  margin: EdgeInsets.only(left: 10,right: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.orange, width: 3)),
                ),
                Container(
                  height: 12, width: 12,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                ),
                Container(
                  height: 12, width: 12,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                ),
                Container(
                  height: 12, width: 12,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_bag_outlined,
          color: Colors.white, size: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
  }
}