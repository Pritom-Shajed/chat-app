import 'package:flutter/material.dart';

 class AppColors {

   AppColors._();

  static Color baseColor = hexToColor('#222455');
  static Color baseFontColor = Colors.black;
  static Color lightFontColor = hexToColor('#383C40');
  static Color extraLightFontColor = hexToColor('#A4A9AF');
  static Color primaryColor = hexToColor('#0013de');
  static Color lightScaffoldBackgroundColor = hexToColor('#F8F8F8');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = Colors.greenAccent;
  static Color secondaryDarkAppColor = hexToColor('#2F2E2E');
  static Color lightGray = hexToColor('#F6F6F6');
  static Color white = Colors.white;
   static Color green = Colors.green;
   static Color blue = Colors.blue;
   static Color shadowColor = Colors.grey.withOpacity(.3);
   static Color stokeColor = hexToColor('#D2DBE0');
   static Color dividerColor = hexToColor('#D2DBE0');

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