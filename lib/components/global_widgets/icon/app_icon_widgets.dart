import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIconWidgets {
  static Widget iconDataIcon(
      {double? iconSize, double? avatarSize, Color? color, required IconData icon}) =>
      CircleAvatar(
        backgroundColor: AppColors.baseColor,
        radius: avatarSize ?? Dimensions.radius16,
        child: Icon(
          icon,
          size: iconSize ?? Dimensions.radius14,
          color: color ?? AppColors.white,
        ),
      );

  static Widget svgAssetIcon(
          {double? size, Color? color, required String iconPath}) =>
      SvgPicture.asset(
        iconPath,
        width: size,
        height: size,
        color: color,
      );

  static Widget pngAssetIcon(
      {double? size,
      Color? color,
      BoxFit fit = BoxFit.cover,
      required String iconPath}) {
    return Image.asset(
      iconPath,
      width: size,
      color: color,
      fit: fit,
    );
  }
}
