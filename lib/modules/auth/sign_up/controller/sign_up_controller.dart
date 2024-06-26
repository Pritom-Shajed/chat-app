import 'package:chat_app/network/network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class SignUpController extends GetxController {
  // AUTH
  final _isPassVisible = false.obs;

  bool get isPassVisible => _isPassVisible.value;

  set isPassVisible (value) => _isPassVisible.value = value;

  toggleIsPassVisible () => isPassVisible = !isPassVisible;


  // Controllers
  late RoundedLoadingButtonController buttonController;
  late TextEditingController emailController;
  late TextEditingController passController;

  //Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    buttonController = RoundedLoadingButtonController();
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    buttonController.reset();
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  //Firebase

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseModel> signUp() async {
    try {

      //Crate user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passController.text.trim());

      //Save user in a separate doc
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": emailController.text.trim(),
      });

      return ResponseModel(true, "Success");
    } on FirebaseAuthException catch (e) {
      return ResponseModel(false, e.code);
    }
  }
}