import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'modal.dart';

class ChatService extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final currentUser = auth.currentUser!.uid;
    final email = auth.currentUser!.email;
    final timeStamp = Timestamp.now();
    var model = Model(currentUser, email!, receiverId, message, timeStamp,seen: false);

    List id = [currentUser, receiverId];
    id.sort();
    String chatRoomId = id.join("_");
    await firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(model.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List id = [userId, otherUserId];
    id.sort();
    var chatRoomId = id.join("_");
    return firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
  Future<void> deleteMessage(String receiveId,String message)async {
    final currentUser = auth.currentUser!.uid;
    List id = [currentUser, receiveId];
    id.sort();
    String chatRoomId = id.join("_");
    await firestore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .doc(message)
        .delete();
  }
}
