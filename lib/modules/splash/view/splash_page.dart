import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/utils/constants/constants.dart';
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
          AppIconWidgets.pngAssetIcon(iconPath: AppPngIcons.appLogo, size: Dimensions.radius44),
          12.verticalSpace,
          AppLoaders.spinningLines(size: Dimensions.radius18),
        ],
      ),
    );
  }
}