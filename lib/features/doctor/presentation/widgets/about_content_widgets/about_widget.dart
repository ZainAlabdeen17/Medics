import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.details,
  });
  final String title;
  final String icon;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 22.w, height: 22.h, child: SvgPicture.asset(icon)),
            SizedBox(width: 8.w),
            Text(
              title,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          details,
          style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
