import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

abstract class AppLoaders {


  static Widget spinningLines ({double? size, Color? color}){
    return SpinKitThreeBounce(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget pulse ({double? size, Color? color}){
    return SpinKitPulse(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget wave ({double? size, Color? color}){
    return SpinKitWave(
      color:  color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget dancingSquare ({double? size, Color? color}) {
    return SpinKitDancingSquare(
      color: color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }

  static Widget foldingCube ({double? size, Color? color}) {
    return SpinKitFoldingCube(
      color: color ?? AppColors.primaryColor,
      size: size ?? Dimensions.radius30,
    );
  }
}