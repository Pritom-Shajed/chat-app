import 'package:chat_app/modules/chat/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderId,
      required this.receiverId,
      required this.senderEmail,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> toJson (){
    return {
      'senderId' : senderId,
      'senderEmail' : senderEmail,
      'receiverId' : receiverId,
      'message' : message,
      'timestamp' : timestamp,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        senderEmail: json['senderEmail'],
        message: json['message'],
        timestamp: json['timestamp']);
  }
}
