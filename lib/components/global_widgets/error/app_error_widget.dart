import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  const AppErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTexts.smallText(
          text: message,
        ),
      ),
    );
  }
}