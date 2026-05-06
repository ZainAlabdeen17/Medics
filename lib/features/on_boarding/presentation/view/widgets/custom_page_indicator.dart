import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/features/on_boarding/data/on_boarding_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: listOnBoardingItem.length,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.surfaceAccent,
        dotColor: AppColors.borderPrimary,
        dotHeight: 4.h,
        dotWidth: 15.w,
        spacing: 8.w,
      ),
    );
  }
}
