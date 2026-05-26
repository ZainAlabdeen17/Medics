import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceCard,
      ),
      child: Center(
        child: SizedBox(
          width: 24.w,
          height: 24.h,
          child: SvgPicture.asset(Assets.assetsImagesIconsGeneralProfile),
        ),
      ),
    );
  }
}
