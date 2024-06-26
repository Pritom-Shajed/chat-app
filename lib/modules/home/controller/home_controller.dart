import 'package:chat_app/network/network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser (){
    return  _auth.currentUser;
  }


  Future<ResponseModel> signOut () async{
   try {
     await _auth.signOut();

     return ResponseModel(true, 'Success');
   } on FirebaseAuthException catch (e) {
     return ResponseModel(false, e.code);
   }
  }

  // Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getUsers() async {
    final snapshot = await _firestore.collection('Users').get();
    final users = snapshot.docs.map((doc) {
      // Going through each individual user
      return doc.data();
    }).toList();

    return users;
  }

  // Stream<List<Map<String, dynamic>>> getUsersStream (){
  //   return _firestore.collection('Users').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc){
  //       //Going through each individual users
  //       final user = doc.data();
  //
  //       return user;
  //     }).toList();
  //   });
  //
  // }

}