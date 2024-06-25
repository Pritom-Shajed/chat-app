import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/controller/home_controller.dart';
import 'package:dokan_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: GlobalAppBar.common(text: 'Home', actionIcon: Icons.logout, onTapActionIcon: (){
        controller.signOut().then((response){
          if(response.isSuccess){
            Get.offAllNamed(Routes.SIGN_IN);
          } else {
            AppToasts.shortToast(response.message);
          }
        });
      }),
    );
  }
}
