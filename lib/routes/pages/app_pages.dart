import 'package:dokan_app/modules/splash/splash.dart';
import 'package:get/get.dart';
part '../routes/app_routes.dart';

abstract class AppPages {

  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}