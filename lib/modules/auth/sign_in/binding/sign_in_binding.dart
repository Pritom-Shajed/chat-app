import 'package:get/get.dart';

import '../sign_in.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(()=> SignInController(), fenix: true);
  }

}