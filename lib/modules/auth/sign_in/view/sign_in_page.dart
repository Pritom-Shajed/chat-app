import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/components/global_widgets/text_fields/app_text_fields.dart';
import 'package:chat_app/helper/extensions/build_context_extensions.dart';
import 'package:chat_app/modules/auth/auth.dart';
import 'package:chat_app/modules/auth/sign_in/sign_in.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/utils/constants/app_icons/app_icons.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: REdgeInsets.all(24),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.verticalSpace,
                  AuthWidgets.header(),
                  52.verticalSpace,
                  Obx(() => AuthWidgets.body(context,
                      emailController: controller.emailController,
                      passController: controller.passController,
                      onTapPassVisibility: controller.toggleIsPassVisible,
                      isPassVisible: controller.isPassVisible)),
                  52.verticalSpace,
                  AuthWidgets.footer(
                      btnController: controller.buttonController,
                      onTapSignIn: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                           controller.signIn().then((response) async{
                             if(response.isSuccess){
                               controller.buttonController.success();
                               await Future.delayed(const Duration(milliseconds: 500));
                               Get.offAllNamed(Routes.HOME);
                             } else {
                               AppToasts.shortToast(response.message);
                               controller.buttonController.error();
                               await Future.delayed(const Duration(seconds: 1));
                               controller.buttonController.reset();
                             }

                          });

                        } else {
                          controller.buttonController.error();
                          await Future.delayed(const Duration(seconds: 1));
                          controller.buttonController.reset();
                        }
                      },
                      onTapSignUp: () => Get.toNamed(Routes.SIGN_UP)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
