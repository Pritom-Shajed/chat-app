import 'package:dokan_app/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';
import 'utils/constants/constants.dart';
import 'utils/styles/styles.dart';

void main() {
  Initializer.init(() =>  runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 893),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              defaultTransition: Transition.cupertino,
              theme: ThemeConfig.lightTheme,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            ));
  }
}

