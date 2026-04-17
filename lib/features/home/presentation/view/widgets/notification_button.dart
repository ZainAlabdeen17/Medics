import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Stack(
          alignment: Alignment(0.75, -0.9),
          children: [
            //notification icon
            SvgPicture.asset(
              Assets.assetsImagesIconsGeneralNotification,
              width: 24.w,
              height: 24.h,
            ),
            //notification dot
            Container(
              width: 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: AppColors.surfaceAccent,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
