import 'package:chat_app/modules/auth/auth.dart';
import 'package:chat_app/modules/chat/chat.dart';
import 'package:chat_app/modules/home/home.dart';
import 'package:chat_app/modules/splash/splash.dart';
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

    //AUTH
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpPage(),
      binding: SignUpBinding()
    ),

    //HOME
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),

    //CHAT
    GetPage(
        name: Routes.CHAT,
        page: () => const ChatPage(),
        binding: ChatBinding()
    ),


  ];
}