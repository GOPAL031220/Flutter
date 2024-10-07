import 'package:flutter/material.dart';
import 'package:assignment/assessment(sqflite)/modelclass.dart';
import 'package:assignment/assessment(sqflite)/repository.dart';
class SearchDonorScreen extends StatefulWidget {
  _SearchDonorScreenState createState() => _SearchDonorScreenState();
}

class _SearchDonorScreenState extends State<SearchDonorScreen> {
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
      appBar: AppBar(title: Text('Search Donors')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search by name or blood type',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _buildDonorList(),
            ),
          ],
        ),
      ),
    );
  }
  String _searchQuery = '';
  Widget _buildDonorList() {
    final filteredDonors = _categoryList.where((donor) {
      final searchLower = _searchQuery.toLowerCase();
      return donor.name!.toLowerCase().contains(searchLower) ||
          donor.blood_group!.toLowerCase().contains(searchLower);
    }).toList();

    return ListView.builder(
      itemCount: filteredDonors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            elevation: 8.0,
            child: ListTile(
              leading: CircleAvatar(radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Text(filteredDonors[index].blood_group.toString(),
                  style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              title: Text(filteredDonors[index].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Row(
                children: [
                  Text(filteredDonors[index].contact.toString()),
                  SizedBox(width: 10),
                  Text(filteredDonors[index].location.toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
