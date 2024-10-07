import 'package:assignment/assessment(sqflite)/modelclass.dart';
import 'package:assignment/assessment(sqflite)/repository.dart';
import 'package:flutter/material.dart';

class Donorlist extends StatefulWidget {
  const Donorlist({super.key});
  State<Donorlist> createState() => _DonorlistState();
}

class _DonorlistState extends State<Donorlist> {
  void initState(){
    super.initState();
    getAllTasks();
  }
  Repository red = Repository();
  List<Bloodmodel> _categoryList = [];

  getAllTasks() async {
    _categoryList.clear();
    List categories = await red.readDonorsData('Donors');
    categories.forEach((cat){
      setState(() {
        var c = Bloodmodel();
        c.id = cat['id'];
        c.name = cat['name'];
        c.blood_group = cat['blood_group'];
        c.contact = cat['contact'];
        c.location = cat['location'];
        _categoryList.add(c);
      });
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donors List'),),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0,left: 10.0,right: 10.0),
          child: Card(
            elevation: 8.0,
            child: ListTile(
              leading: CircleAvatar(radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Text(_categoryList[index].blood_group.toString(),
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              title: Text(_categoryList[index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Row(
                children: [
                    Text(_categoryList[index].contact.toString()),
                    SizedBox(width: 10),
                    Text(_categoryList[index].location.toString()),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('ARE YOU SURE YOU WANT TO DELETE THIS DONOR?',
                          style: TextStyle(fontSize: 17),),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              red.deleteDonor('Donors', _categoryList[index].id);
                              setState(() {
                                _categoryList.removeAt(index);
                              });
                              getAllTasks();
                              Navigator.of(context).pop();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Donor Deleted Successfully!')));
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );

                },
              ),
            ),
          ),
        );
      },
        itemCount: _categoryList.length,
      ),
    );
  }
}
