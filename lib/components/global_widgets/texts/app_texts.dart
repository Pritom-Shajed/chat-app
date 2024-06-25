import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';

abstract class AppTexts {

  static Widget extraLargeText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize24, fontWeight: fontWeight),);
  }

  static Widget largeText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize18, fontWeight: fontWeight),);
  }

  static Widget mediumText ({int? maxLine, TextOverflow? overflow, required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, maxLines: maxLine, overflow: overflow, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize14, fontWeight: fontWeight ),);
  }

  static Widget smallText ({required String text, double? fontSize, TextAlign? textAlign, Color? color, FontWeight? fontWeight}){
    return Text(text, textAlign: textAlign, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: fontSize ?? Dimensions.fontSize12, fontWeight: fontWeight ),);
  }

  static Widget verySmallText ({required String text, Color? color, FontWeight? fontWeight}){
    return Text(text, style: TextStyle(color: color ?? AppColors.baseFontColor, fontSize: Dimensions.fontSize10, fontWeight: fontWeight),);
  }
}