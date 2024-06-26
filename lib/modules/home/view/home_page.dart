import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/helper/extensions/build_context_extensions.dart';
import 'package:chat_app/modules/home/home.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: GlobalAppBar.common(text: 'Home', actionIcon: Icons.logout, onTapActionIcon: () async{
        context.showLoaderOverlay;
        controller.signOut().then((response){
          if(response.isSuccess){
            Get.offAllNamed(Routes.SIGN_IN);
          } else {
            AppToasts.shortToast(response.message);
          }
          context.hideLoaderOverlay;
        });
      }),
      body: HomeWidgets.userList(stream: controller.getUsersStream(), currentUserEmail: controller.getCurrentUser()?.email ?? ''),
    );
  }
}
