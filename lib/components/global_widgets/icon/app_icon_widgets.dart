import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIconWidgets {

  static Widget svgAssetIcon ({double? size, Color? color, required String iconPath}) => 
  SvgPicture.asset(iconPath, width: size, height: size, color: color,);

 static Widget pngAssetIcon({double? size, Color? color, BoxFit fit = BoxFit.cover, required String iconPath}){
     return Image.asset(iconPath, width: size, height: size, color: color, fit: fit,);
   }

}