import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PatientHeader extends StatelessWidget {
  final VoidCallback onTap;
  final PageController controller;
  const PatientHeader({
    super.key,
    required this.onTap,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
        ),
        SizedBox(width: 68.w),
        SmoothPageIndicator(
          controller: controller,
          count: 4,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.surfaceAccent,
            dotColor: AppColors.borderPrimary,
            dotHeight: 4.h,
            dotWidth: 15.w,
          ),
        ),
      ],
    );
  }
}
