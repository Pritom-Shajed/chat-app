import 'package:flutter/material.dart';

 class AppColors {

   AppColors._();

  static Color baseColor = hexToColor('#222455');
  static Color baseFontColor = Colors.black;
  static Color lightFontColor = Colors.black45;
  static Color primaryColor = Colors.green;
  static Color lightScaffoldBackgroundColor = hexToColor('#F8F8F8');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = Colors.greenAccent;
  static Color secondaryDarkAppColor = hexToColor('#2F2E2E');
  static Color lightGray = hexToColor('#F6F6F6');
  static Color white = Colors.white;


  static Color skeletonColor1 = Colors.grey.shade200;
  static Color skeletonColor2 = Colors.grey.shade100;

}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}