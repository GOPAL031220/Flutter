import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  List<String> _names = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('List View Demo'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _names.add(_nameController.text);
                  _nameController.clear();
                });
              }
            },
            child: Text('Add Name'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_names[index]),
                  onLongPress: () {
                    _showContextMenu(context, index);
                  },
                  onTap: () {
                    _showDialog(context, _names[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Name'),
          content: Text(name),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _showContextMenu(BuildContext context, int index) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem(
          child: Text('Delete Item'),
          value: 'delete',
        ),
        PopupMenuItem(
          child: Text('Edit Item'),
          value: 'edit',
        ),
        PopupMenuItem(
          child: Text('Exit'),
          value: 'exit',
        ),
      ],
      elevation: 8.0,     //menu ko shadow dene ke liye
    ).then((value) {
      if (value == 'delete') {
        _showDeleteDialog(context, index);
      } else if (value == 'edit') {
        _showEditDialog(context, index);
      }
    });
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _names.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    final _editController = TextEditingController(text: _names[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextFormField(
            controller: _editController,
            decoration: InputDecoration(
              labelText: 'Enter New Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _names[index] = _editController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
