import 'package:chat_app/modules/chat/chat.dart';
import 'package:get/get.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(()=> ChatController(), fenix: true);
  }

}