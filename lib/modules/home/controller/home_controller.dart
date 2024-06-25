import 'package:dokan_app/network/network.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<ResponseModel> signOut () async{
   try {
     await _auth.signOut();

     return ResponseModel(true, 'Success');
   } on FirebaseAuthException catch (e) {
     return ResponseModel(false, e.code);
   }
  }

}