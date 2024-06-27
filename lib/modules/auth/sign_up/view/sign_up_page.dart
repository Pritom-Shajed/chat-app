import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/modules/auth/auth.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
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
                  AuthWidgets.header(isSignIn: false),
                  52.verticalSpace,
                  Obx(() => AuthWidgets.body(context,
                      isSignIn: false,
                      nameController: controller.nameController,
                      emailController: controller.emailController,
                      passController: controller.passController,
                      onTapPassVisibility: controller.toggleIsPassVisible,
                      isPassVisible: controller.isPassVisible)),
                  52.verticalSpace,
                  AuthWidgets.footer(
                    isSignIn: false,
                      btnController: controller.buttonController,
                      onTapSignUp: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          controller.signUp().then((response) async{
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
                      onTapSignIn: () => Get.back()
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
