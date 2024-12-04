import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegram/sign_in.dart';
import 'chat_page.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF639BF6),
        title: const Text(
          'Chat Wave',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            child: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 27,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _userList(),
      ),
    );
  }

  Widget _userList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: const Color(0xFF639BF6),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No users found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          List<DocumentSnapshot> list = snapshot.data!.docs;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var data = list[index].data() as Map<String, dynamic>;

              // Safely extract fields with default values
              var name = data['firstName'] ?? 'Unknown';
              var email = data['email'] ?? '';
              var image = data['image'] ??
                  'https://via.placeholder.com/150'; // Default placeholder image
              var uid = data['uid'] ?? '';

              // Skip rendering current user
              if (auth.currentUser?.email != email) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 30,
                  ),
                  title: Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: const Text(
                    'Hey there, can we be friends?',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chatpage(
                        receiverEmail: name,
                        receiverId: uid,
                      ),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink(); // Avoid rendering an empty container
              }
            },
          );
        }
      },
    );
  }
}
