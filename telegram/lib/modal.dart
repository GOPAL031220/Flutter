import 'package:cloud_firestore/cloud_firestore.dart';

class Model{
  String senderId;
  String senderEmail;
  String receiverId;
  String message;
  Timestamp  timestamp;
  bool seen;

  Model(this.senderId, this.senderEmail, this.receiverId, this.message,
      this.timestamp,{this.seen = false});

  Map<String,dynamic> toMap(){
    return {
      'senderId':senderId,
      'senderEmail':senderEmail,
      'receiverId':receiverId,
      'message':message,
      'timeStamp':timestamp,
      'seen': seen,
    };
  }
}