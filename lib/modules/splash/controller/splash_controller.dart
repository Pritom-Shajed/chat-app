import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onReady() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.onReady();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }
}