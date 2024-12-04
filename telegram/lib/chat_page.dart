import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_services.dart';

class Chatpage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;

  Chatpage({super.key, required this.receiverEmail, required this.receiverId});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  var enterMessage = TextEditingController();
  final chatService = ChatService();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();

  void sendMessage() async {
    if (enterMessage.text.isNotEmpty) {
      await chatService.sendMessage(
          widget.receiverId, enterMessage.text.trim());
      enterMessage.clear();

      // Scroll to the bottom after sending the message
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void markAsSeen(String messageId) async {
    List id = [auth.currentUser!.uid, widget.receiverId];
    id.sort();
    String chatRoomId = id.join("_");


    await firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .doc(messageId)
        .update({'seen': true});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF639BF6),
        title: Row(children: [
          Text(
            widget.receiverEmail,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ]),
      ),
      body: Column(
        children: [
          SizedBox(height: 6),
          Expanded(child: _buildMessageList()), // List of messages
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: TextField(
                        cursorColor: Colors.black,
                        cursorHeight: 18,
                        cursorWidth: 2,
                        maxLines: null,
                        controller: enterMessage,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29),
                              borderSide: BorderSide(color: Color(0xFFD3D3D3))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(29),
                              borderSide: BorderSide(color: Color(0xFFD3D3D3))),
                          hintText: 'Enter your Message...',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      sendMessage();
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF639BF6),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: chatService.getMessages(widget.receiverId, auth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xFF639BF6),
            ),
          );
        }

        List<DocumentSnapshot> messages = snapshot.data!.docs;
        String? lastDay; // To track the last message's day

        return ListView.builder(
          controller: _scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            var message = messages[index];
            var data = message.data() as Map<String, dynamic>;
            var time = (data['timeStamp'] as Timestamp).toDate();


            DateTime now = DateTime.now();
            var isCurrentWeek = now.difference(time).inDays < 7 && now.weekday >= time.weekday;
            var formattedDate = DateFormat('dd MMMM yyyy').format(time);
            var dayOfWeek = DateFormat('EEEE').format(time);

            var day = DateFormat('yyyy-MM-dd').format(time);


            bool showDate = lastDay != day;
            lastDay = day;

            return Column(
              children: [
                if (showDate)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF639BF6),
                      ),
                      child: Text(
                        isCurrentWeek ? dayOfWeek : formattedDate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                _buildMessageItem(message),
              ],
            );
          },
        );
      },
    );
  }



  Widget _buildMessageItem(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    var id = snapshot.id;
    var alignment = (data['senderId'] == auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    var time = (data['timeStamp'] as Timestamp).toDate();
    var format = DateFormat('hh:mm').format(time);

    bool isSeen = data['seen'] ?? false;

    if (data['senderId'] != auth.currentUser!.uid && !isSeen) {
      markAsSeen(id);
    }

    return GestureDetector(
      onLongPress: () {
        if(data['senderId'] == auth.currentUser!.uid)
          _showDeleteDialog(id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Container(
          alignment: alignment,
          child: Column(
            crossAxisAlignment: (data['senderId'] == auth.currentUser!.uid)? CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: (data['senderId'] == auth.currentUser!.uid)
                      ? Color(0xFF639BF6)
                      : Color(0xFFD3D3D3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['message'],
                      style: TextStyle(
                        fontSize: 16,
                        color: (data['senderId'] == auth.currentUser!.uid)
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [Text(
                          format,
                          style: TextStyle(fontSize: 10, color: (data['senderId'] == auth.currentUser!.uid)? Colors.white:Colors.black),
                        ),
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),


              if (data['senderId'] == auth.currentUser!.uid)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        child: Icon(
                          isSeen ? Icons.done_all : Icons.check,
                          size: 19,
                          color: isSeen ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(String messageId) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Delete Message'),
            content: Text('Are you sure you want to delete this message?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Cancel',style: TextStyle(color: Colors.black),),
              ),
              TextButton(
                onPressed: () {
                  _deleteMessage(messageId);
                  Navigator.of(context).pop();
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(color:Color(0xFF639BF6),borderRadius: BorderRadius.circular(5)),
                    child: Text('Delete', style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
    );
  }
  void _deleteMessage(String messageId) async {
    List id = [auth.currentUser!.uid, widget.receiverId];
    id.sort();
    String chatRoomId = id.join("_");


    await firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .doc(messageId)
        .delete();
  }
}
