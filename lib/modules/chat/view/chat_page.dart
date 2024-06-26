import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/modules/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});

  final controller = Get.find<ChatController>();

  final receiverEmail = Get.parameters['receiverEmail'] ?? "";

  final receiverId = Get.parameters['receiverId'] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar.common(text: receiverEmail),
        body: Padding(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 24, top: 6),
          child: Column(
            children: [
              // Displaying message
              Expanded(
                  child: ChatWidgets.messageList(
                    scrollController: controller.scrollController,
                    currentUserId: controller.getCurrentUser()?.uid ?? '',
                stream: controller.getMessages(
                    receiverId, controller.getCurrentUser()?.uid ?? ''),
              )),

              //User Input
              ChatWidgets.userInput(context,
                  focusNode: controller.focusNode,
                  messageController: controller.messageController,
                  onTap: () => controller.sendMessage(receiverId, controller.messageController.text.trim()))
            ],
          ),
        ));
  }
}
