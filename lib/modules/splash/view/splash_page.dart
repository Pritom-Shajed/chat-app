import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/helper/extensions/build_context_extensions.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIconWidgets.pngAssetIcon(iconPath: AppPngIcons.appLogo, size: context.screenWidth * 0.2),
          12.verticalSpace,
          AppLoaders.spinningLines(size: Dimensions.radius18),
        ],
      ),
    );
  }
}