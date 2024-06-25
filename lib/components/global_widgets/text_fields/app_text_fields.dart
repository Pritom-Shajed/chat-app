import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppTextFields {
  AppTextFields._();

  static Widget textFieldHintOnly(BuildContext context,{ValueChanged<String?>? onChanged, bool obscureText = false, VoidCallback? onTapSuffixIcon,  String? suffixIconSvgPath, String? fontFamily, TextInputType? keyboardType, bool enabled = true, String? Function(String?)? validator, VoidCallback? onTapPrefixIcon, String? prefixIconSvgPath, required String hintText, TextEditingController? controller, int maxLine = 1,}) =>
      Container(
        padding: REdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 3),
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: AppColors.shadowColor),
            ]),
        child: TextFormField(
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            style:  TextStyle(
                fontFamily: fontFamily ?? AppFonts.nexa,
                fontWeight: FontWeight.normal
            ),
            obscureText: obscureText,
            maxLines: maxLine,
            enabled: enabled,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: !enabled,
              fillColor: enabled == false ? Colors.grey.shade200 : AppColors.white,
              isDense: prefixIconSvgPath == null ? false : true,
              hintText: hintText,
              prefixIcon: prefixIconSvgPath == null
                  ? null
                  : GestureDetector(
                onTap: onTapPrefixIcon,
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  // Adjust the padding as needed
                  child: AppIconWidgets.svgAssetIcon(iconPath: prefixIconSvgPath, size: Dimensions.radius24),
                ),
              ),
              suffixIcon: suffixIconSvgPath == null
                  ? const SizedBox()
                  : GestureDetector(
                onTap: onTapSuffixIcon,
                child: Padding(
                  padding: REdgeInsets.symmetric(
                      horizontal: 16),
                  child: AppIconWidgets.svgAssetIcon(iconPath: suffixIconSvgPath, size: Dimensions.radius24),
                ),
              ),
              hintStyle: TextStyle(
                  fontFamily: fontFamily ?? AppFonts.nexa,
                  color: AppColors.extraLightFontColor,
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  borderSide: const BorderSide(color: Colors.transparent)
              ),
            )),
      );

  static Widget textFieldWithTitle(BuildContext context,{ValueChanged<String?>? onChanged, bool obscureText = false, VoidCallback? onTapSuffixIcon,  String? suffixIconSvgPath, String? fontFamily, TextInputType? keyboardType, bool enabled = true, String? Function(String?)? validator, VoidCallback? onTapPrefixIcon, String? prefixIconSvgPath, required String title, String? hintText, TextEditingController? controller, int maxLine = 1,}) =>
      Padding(
        padding: REdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTexts.mediumText(text: title, color: AppColors.lightFontColor),
            12.verticalSpace,
            TextFormField(
                keyboardType: keyboardType,
                validator: validator,
                controller: controller,
                style:  TextStyle(
                    fontFamily: fontFamily ?? AppFonts.nexa,
                    fontWeight: FontWeight.normal
                ),
                obscureText: obscureText,
                maxLines: maxLine,
                enabled: enabled,
                onChanged: onChanged,
                decoration: InputDecoration(
                  filled: !enabled,
                  fillColor: enabled == false ? Colors.grey.shade200 : AppColors.white,
                  isDense: prefixIconSvgPath == null ? false : true,
                  hintText: hintText ?? title,
                  prefixIcon: prefixIconSvgPath == null
                      ? null
                      : GestureDetector(
                    onTap: onTapPrefixIcon,
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      // Adjust the padding as needed
                      child: AppIconWidgets.svgAssetIcon(iconPath: prefixIconSvgPath, size: Dimensions.radius24),
                    ),
                  ),
                  suffixIcon: suffixIconSvgPath == null
                      ? const SizedBox()
                      : GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                          horizontal: 16),
                      child: AppIconWidgets.svgAssetIcon(iconPath: suffixIconSvgPath, size: Dimensions.radius24),
                    ),
                  ),
                  hintStyle: TextStyle(
                      fontFamily: fontFamily ?? AppFonts.nexa,
                      color: AppColors.extraLightFontColor,
                      fontSize: Dimensions.fontSize14,
                      fontWeight: FontWeight.w500),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      borderSide: BorderSide(color: AppColors.stokeColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      borderSide: BorderSide(color: AppColors.stokeColor)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      borderSide: BorderSide(color: AppColors.stokeColor)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      borderSide: BorderSide(color: AppColors.stokeColor)
                  ),
                )),
          ],
        ),
      );
}