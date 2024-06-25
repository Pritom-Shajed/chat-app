import 'package:get/get.dart';

import '../sign_up.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(()=> SignUpController(), fenix: true);
  }

}