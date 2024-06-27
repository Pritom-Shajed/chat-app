import 'package:chat_app/components/global_widgets/global_widgets.dart';
import 'package:chat_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTiles {
  AppTiles._();

  static Widget userTile ({String? title, required String subtitle, VoidCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.all(24),
        margin: REdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            color: AppColors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius12),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 2,
              spreadRadius: 0.5,
              offset: const Offset(1, 3)
            )
          ]
        ),
        child: Row(
          children: [
            AppIconWidgets.iconDataIcon(icon: Icons.person),
            8.horizontalSpace,
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title == null ? const SizedBox.shrink() : AppTexts.mediumText(text: title),
                title == null ? 0.verticalSpace : 8.verticalSpace,
                AppTexts.smallText(text: subtitle, color: title == null ? AppColors.baseColor : AppColors.lightFontColor),
              ],
            )),
            8.horizontalSpace,
            const Icon(Icons.arrow_forward_ios),

          ],
        ),
      ),
    );
  }
}