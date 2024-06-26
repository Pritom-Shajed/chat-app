import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GlobalAppBar {
  static PreferredSizeWidget common({String? text, IconData? actionIcon, VoidCallback? onTapActionIcon, Color? bgColor, Color? textColor, Color? iconColor}) => AppBar(
        title: text != null ? Text(text, style: TextStyle(fontSize: Dimensions.fontSize16, color: textColor ?? AppColors.baseFontColor),) : null,
        iconTheme: IconThemeData(
          color: iconColor ?? AppColors.baseColor, //change your color here
        ),
        actions: [
          IconButton(onPressed: onTapActionIcon, icon: Icon(actionIcon))
        ],
        backgroundColor: bgColor ?? Colors.transparent,
      );
}
