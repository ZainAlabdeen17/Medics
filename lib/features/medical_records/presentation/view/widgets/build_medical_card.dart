import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class BuildMedicalCard extends StatelessWidget {
  final String iconName;
  final String name;
  final String location;

  const BuildMedicalCard({
    super.key,
    required this.iconName,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(location);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,

        children: [
          Container(
            width: 165.w,
            height: 165.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.borderBlack,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 54.h),
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: SvgPicture.asset(iconName, width: 32.w, height: 32.h),
                ),
                SizedBox(height: 8.h),
                Text(name, style: AppTextStyles.head3),
              ],
            ),
          ),
          Positioned(
            bottom: -22.h,
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                color: AppColors.surfaceAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
