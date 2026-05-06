import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class SpecializationItem extends StatelessWidget {
  const SpecializationItem({
    super.key,
    required this.specializationName,
    required this.icon,
    required this.doctorsCount,
  });
  final String specializationName;
  final String icon;
  final int doctorsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceBlur,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.borderBlack, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 32.w, height: 32.h),
            SizedBox(width: 8.w),
            Text(
              specializationName,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Text(
              "$doctorsCount doctors",
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
