import 'package:flutter/material.dart';

void main() {
  runApp(ContextMenuApp());
}

class ContextMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContextMenuHomePage(),
    );
  }
}

class ContextMenuHomePage extends StatefulWidget {
  @override
  _ContextMenuHomePageState createState() => _ContextMenuHomePageState();
}

class _ContextMenuHomePageState extends State<ContextMenuHomePage> {
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Menu App'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            onLongPress: () {
              _showContextMenu(context, index);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem(
          child: Text('Edit'),
          value: 'edit',
        ),
        PopupMenuItem(
          child: Text('View'),
          value: 'view',
        ),
        PopupMenuItem(
          child: Text('Delete'),
          value: 'delete',
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        _performAction(value, index);
      }
    });
  }

  void _performAction(String action, int index) {
    switch (action) {
      case 'edit':
        _editItem(index);
        break;
      case 'view':
        _viewItem(index);
        break;
      case 'delete':
        _deleteItem(index);
        break;
    }
  }

  void _editItem(int index) {
    // Edit item logic here
    String currentItemValue = _items[index];
    String newItemValue = currentItemValue;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: TextEditingController(text: currentItemValue),
            onChanged: (value) {
              newItemValue = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _items[index] = newItemValue;
                });
                Navigator.pop(context);
                print('Edit item at index $index');
              },
            ),
          ],
        );
      },
    );
  }

  void _viewItem(int index) {
    // View item logic here
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('View Item'),
          content: Text(_items[index]),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    print('View item at index $index');
  }

  void _deleteItem(int index) {
    // Delete item logic here
    setState(() {
      _items.removeAt(index);
    });
    print('Delete item at index $index');
  }
}