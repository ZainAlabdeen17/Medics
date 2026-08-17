import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ProfileOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderPrimary)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      AppColors.iconAccent,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(
                Assets.assetsImagesIconsGeneralArrowRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
