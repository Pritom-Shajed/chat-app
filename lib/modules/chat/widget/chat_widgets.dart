import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/components/global_widgets/text_fields/app_text_fields.dart';
import 'package:chat_app/modules/chat/chat.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidgets {
  ChatWidgets._();

  static Widget messageList ({required Stream<QuerySnapshot> stream, required String currentUserId, required ScrollController scrollController}){
    return StreamBuilder(stream: stream, builder: (context, snapshot){
      //Error
      if (snapshot.hasError) {
        return AppTexts.mediumText(text: Strings.unknownError);
      }

      //Loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLoaders.foldingCube(size: Dimensions.radius20),
              16.verticalSpace,
              AppTexts.smallText(text: 'Loading...')
            ],
          ),
        );
      }

      if(!snapshot.hasData){
        return Center(child: AppTexts.mediumText(text: Strings.unknownError),);
      }

      if(snapshot.data!.docs.isEmpty){
        return Center(child: AppTexts.mediumText(text: 'No messages yet'),);
      }

      //return list
      return ListView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: snapshot.data!.docs
            .map<Widget>((doc) => _messageItem(doc, currentUserId))
            .toList(),
      );
    });
  }

  static Widget userInput (BuildContext context, {TextEditingController? messageController, FocusNode? focusNode, VoidCallback? onTap}){
    return Row(
      children: [
        Expanded(child: AppTextFields.textFieldHintOnly(context, focusNode: focusNode, hintText: 'Type here...', controller: messageController)),
        8.horizontalSpace,
        AppButtons.iconButton(icon: Icons.arrow_upward, onTap: onTap)
      ],
    );
  }
}

Widget _messageItem (DocumentSnapshot doc, String currentUserId){
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  Message messageData = Message.fromJson(data);

  final bool isCurrentUser = messageData.senderId == currentUserId;

  final alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

  return Align(
    alignment: alignment,
    child: Container(
        margin: REdgeInsets.symmetric(vertical: 6),
        padding: REdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius12),
              topRight: Radius.circular(Dimensions.radius12),
              bottomLeft:  Radius.circular( isCurrentUser ? Dimensions.radius12 : 0),
              bottomRight:  Radius.circular( isCurrentUser ? 0 : Dimensions.radius12),
          ),
          color: isCurrentUser ? AppColors.green : AppColors.baseColor,
        ),
        child: AppTexts.mediumText(text: messageData.message, color: AppColors.white)),
  );
}