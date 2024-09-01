import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MyNavDrawer(),
        appBar: AppBar(
          title: Text('Navigation Drawer'),
        ),
        body: Center(
          child: Text(
            'Navigation Drawer',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class MyNavDrawer extends StatelessWidget {
  const MyNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('flutter'),
            accountEmail: Text('flutter@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('Assets/Images/a.jpg'),
            ),
            decoration: BoxDecoration(color: Colors.grey.shade800),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text('Inbox'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => InboxPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Starred'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StarredPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UploadPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.access_alarm),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          )
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: Center(
        child: Text('Inbox Page'),
      ),
    );
  }
}

class StarredPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starred'),
      ),
      body: Center(
        child: Text('Starred Page'),
      ),
    );
  }
}

class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
      ),
      body: Center(
        child: Text('Upload Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Text('Logout Page'),
      ),
    );
  }
}