import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/modules/home/home.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeWidgets {
  HomeWidgets._();

  static Widget userList({required Future<List<Map<String, dynamic>>> future, required String currentUserEmail}) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTexts.extraLargeText(text: 'Users'),
          Divider(color: AppColors.dividerColor,height: 30.h,),
          12.verticalSpace,
          Expanded(
            child: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  //Error
                  if (snapshot.hasError) {
                    return AppTexts.mediumText(text: Strings.unknownError);
                  }

                  //Loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppLoaders.foldingCube(size: Dimensions.radius20),
                          16.verticalSpace,
                          AppTexts.smallText(text: 'Loading...')
                        ],
                      ),
                    );
                  }

                  //Empty list
                  if(!snapshot.hasData){
                    return AppTexts.mediumText(text: 'No users found');
                  }

                  //return list
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: snapshot.data!
                        .map<Widget>((userData) => _userListItem(userData, currentUserEmail))
                        .toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Widget _userListItem(Map<String, dynamic> userData, String currentUserEmail) {

  UserData userInfo = UserData.fromJson(userData);

  if(userInfo.email !=  currentUserEmail){
    return AppTiles.userTile(
        text: userInfo.email,
        onTap: () => Get.toNamed(Routes.CHAT,
            parameters: {"receiverEmail": userInfo.email, "receiverId": userInfo.uid}));
  } else {
    return const SizedBox.shrink();
  }

}
