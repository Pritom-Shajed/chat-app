import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  AppButtons._();

  static Widget iconButton ({Key? key, double? size, VoidCallback? onTap, required IconData icon, Color? color}){
    return IconButton(key: key, onPressed: onTap, icon: Icon(icon, color: color ?? AppColors.white, size: size ?? 24.h,));
  }
}