import 'dart:developer';

import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/modules/chat/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late TextEditingController messageController;

  late  ScrollController scrollController;

  final FocusNode focusNode = FocusNode();

  @override
  void onInit() async {
    messageController = TextEditingController();
    scrollController  = ScrollController();
    focusNode.addListener((){
      if(focusNode.hasFocus){
        //cause a delay so that the keyboard has time to show up
        //then the amount of remaining space will be calculated
        //then scroll down
        Future.delayed(const Duration(milliseconds: 500),
              () => scrollDown(),
        );

      }
    });

    //wait a bit for listview to be built and then scroll to bottom
    Future.delayed(const Duration(milliseconds: 500),
          () => scrollDown(),
    );
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  //Auto Scrolling Mechanism
  void scrollDown  () {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  // Getting current user

  User? getCurrentUser (){
    return  _auth.currentUser;
  }

  //Send Message
  Future<void> sendMessage(String receiverId, message) async {
    if (messageController.text.isNotEmpty) {
      //get current user info
      final String currentUserId = _auth.currentUser?.uid ?? '';
      final String currentUserEmail = _auth.currentUser?.email ?? '';
      final Timestamp timestamp = Timestamp.now();

      //create new message
      Message newMessage = Message(
          senderId: currentUserId,
          receiverId: receiverId,
          senderEmail: currentUserEmail,
          message: message,
          timestamp: timestamp);

      //construct chat room ID for the two users
      List<String> ids = [currentUserId, receiverId];
      ids.sort(); // This ensures the chatroomId is the same for any 2 person

      String chatRoomId = ids.join('_');

      //add new message to database
      try {
        await _firestore
            .collection(('chat_rooms'))
            .doc(chatRoomId)
            .collection('messages')
            .add(newMessage.toJson());
        scrollDown();
        messageController.clear();
      } catch (e){
        throw Exception(e.toString());
      }

    } else {
      AppToasts.shortToast(
        'Type anything to send',
      );
    }

  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId, ) {
    List<String> ids = [userId, otherUserId];
    ids.sort(); // This ensures the chatroomId is the same for any 2 person

    String chatRoomId = ids.join('_');

    //get message to database
    return _firestore
        .collection(('chat_rooms'))
        .doc(chatRoomId)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
