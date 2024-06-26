import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToasts {
  AppToasts._();

  static void shortToast (message, {ToastGravity? gravity}){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.CENTER,
      backgroundColor: AppColors.baseColor,
      textColor: Colors.white,
      fontSize: Dimensions.fontSize12,
    );
  }
}