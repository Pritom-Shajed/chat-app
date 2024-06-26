import 'package:chat_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    await Future.delayed(const Duration(milliseconds: 1500));

    if(_auth.currentUser != null){
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGN_IN);
    }



    super.onReady();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }
}