import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/components/global_widgets/text_fields/app_text_fields.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:chat_app/utils/constants/regex/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class AuthWidgets {
  AuthWidgets._();


  static Widget header ({bool isSignIn = true}){
    return Column(
      children: [
        AppIconWidgets.pngAssetIcon(iconPath: AppPngIcons.appLogo, size: Get.width * 0.5),

        24.verticalSpace,

        AppTexts.extraLargeText(text: isSignIn ? 'Sign In' : 'Sign Up'),
      ],
    );
  }

  static Widget body(BuildContext context,
      {TextEditingController? emailController,
      TextEditingController? passController,
      TextEditingController? nameController,
      bool isPassVisible = false,
        bool isSignIn = true,
      VoidCallback? onTapPassVisibility}) {
    return Column(
      children: [
        isSignIn ? const SizedBox.shrink() : AppTextFields.textFieldHintOnly(
          context,
          hintText: 'Name',
          controller: nameController,
          validator: (name){
            if(name == null || name.isEmpty){
              return Strings.emptyTextField;
            }
            return null;
          },
        ),
        isSignIn ? 0.verticalSpace : 16.verticalSpace,
        AppTextFields.textFieldHintOnly(
          context,
          hintText: 'Email',
          controller: emailController,
          validator: (email){
            if(email == null || email.isEmpty){
              return Strings.emptyTextField;
            } else if(!AppRegex.isEmailValid(email)){
              return Strings.emailNotValid;
            }
            return null;
          },
        ),
        16.verticalSpace,
        AppTextFields.textFieldHintOnly(context,
          hintText: 'Password',
          controller: passController,
          suffixIconSvgPath:
          isPassVisible ? AppSvgIcons.eyeOpened : AppSvgIcons.eyeClosed,
          onTapSuffixIcon: onTapPassVisibility,
          obscureText: !isPassVisible,
          validator: (pass) {
            if (pass == null || pass.isEmpty) {
              return Strings.emptyTextField;
            } else if(!AppRegex.isPassValid(pass)){
              return Strings.passNotValid;
            }
            return null;
          },
        ),
      ],
    );
  }

  static Widget footer ({required RoundedLoadingButtonController btnController, bool isSignIn = true, VoidCallback? onTapSignIn, VoidCallback? onTapSignUp}){
    return Column(
      children: [
        AppButtons.loadingButton(controller: btnController, onTap: (){
         if(isSignIn){
           onTapSignIn?.call();
         } else {
           onTapSignUp?.call();
         }
        }, text: isSignIn ? 'Sign in' : "Sign up"),

        52.verticalSpace,
        AppButtons.textButton(onTap: (){
          if(isSignIn){
            onTapSignUp?.call();
          } else {
            onTapSignIn?.call();
          }
        } ,text:  isSignIn ? 'Sign up' : "Sign in")
      ],
    );
  }
}