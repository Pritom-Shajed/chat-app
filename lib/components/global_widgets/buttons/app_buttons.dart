import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class AppButtons {
  AppButtons._();

  static Widget iconButton(
      {Key? key,
      double? iconSize,
      double? avatarSize,
      VoidCallback? onTap,
      required IconData icon,
      Color? color}) {
    return CircleAvatar(
      backgroundColor: AppColors.baseColor,
        radius: avatarSize ?? Dimensions.radius24,
        child: IconButton(
            key: key,
            onPressed: onTap,
            icon: Icon(
              icon,
              color: color ?? AppColors.white,
              size: iconSize ?? 22.h,
            )));
  }

  static Widget loadingButton(
      {required RoundedLoadingButtonController controller,
      required VoidCallback onTap,
      required String text,
      Color strokeColor = Colors.transparent,
      Color? textColor,
      Color? bgColor}) {
    return RoundedLoadingButton(
      controller: controller,
      onPressed: onTap,
      successColor: AppColors.primaryColor,
      color: bgColor ?? AppColors.primaryColor,
      child: Padding(
        padding: REdgeInsets.all(8),
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontSize: Dimensions.fontSize16)),
      ),
    );
  }

  static Widget textButton(
      {required String text,
      double? fontSize,
      FontWeight? fontWeight,
      VoidCallback? onTap,
      Color? color}) {
    return GestureDetector(
        onTap: onTap,
        child: AppTexts.smallText(
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.bold,
            color: color ?? AppColors.primaryColor));
  }
}
