import 'package:flutter/material.dart';

class GmailHomePage extends StatefulWidget {
  @override
  _GmailHomePageState createState() => _GmailHomePageState();
}

class _GmailHomePageState extends State<GmailHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    InboxScreen(),
    StarredScreen(),
    SentScreen(),
    DraftsScreen(),
    TrashScreen(),
  ];

  final List<String> _titles = [
    'Inbox',
    'Starred',
    'Sent',
    'Drafts',
    'Trash',
  ];

  void onNavigationItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      drawer: NavigationDrawer(
        onItemSelected: onNavigationItemSelected,
      ),
      body: _children[_currentIndex],
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  NavigationDrawer({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Inbox'),
            onTap: () {
              onItemSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Starred'),
            onTap: () {
              onItemSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Sent'),
            onTap: () {
              onItemSelected(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Drafts'),
            onTap: () {
              onItemSelected(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Trash'),
            onTap: () {
              onItemSelected(4);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Email $index'),
            subtitle: Text('This is a dummy email'),
          );
        },
      ),
    );
  }
}

class StarredScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Starred Email $index'),
            subtitle: Text('This is a dummy starred email'),
          );
        },
      ),
    );
  }
}

class SentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Sent Email $index'),
            subtitle: Text('This is a dummy sent email'),
          );
        },
      ),
    );
  }
}

class DraftsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Draft Email $index'),
            subtitle: Text('This is a dummy draft email'),
          );
        },
      ),
    );
  }
}

class TrashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Deleted Email $index'),
            subtitle: Text('This is a dummy deleted email'),
          );
        },
      ),
    );
  }
}