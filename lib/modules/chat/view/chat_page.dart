import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/modules/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = Get.find<ChatController>();

  final _receiverEmail = Get.parameters['receiverEmail'] ?? "";

  final _receiverName = Get.parameters['receiverName'] ?? "";

  final _receiverId = Get.parameters['receiverId'] ?? "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar.common(text: _receiverName.isNotEmpty ? _receiverName : _receiverEmail),
        body: Padding(
          padding: REdgeInsets.only(left: 16, right: 16, bottom: 24, top: 6),
          child: Column(
            children: [
              // Displaying message
              Expanded(
                  child: ChatWidgets.messageList(
                    currentUserId: _controller
                        .getCurrentUser()
                        ?.uid ?? '',
                    stream: _controller.getMessages(
                        _receiverId, _controller
                        .getCurrentUser()
                        ?.uid ?? ''),
                  )),

              //User Input
              ChatWidgets.userInput(context,
                  messageController: _controller.messageController,
                  onTap: () =>
                      _controller.sendMessage(
                          _receiverId,
                          _controller.messageController.text.trim())
              )
            ],
          ),
        ));
  }
}
