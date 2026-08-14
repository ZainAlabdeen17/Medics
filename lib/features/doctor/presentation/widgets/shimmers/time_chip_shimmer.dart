import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class TimeChipShimmer extends StatelessWidget {
  const TimeChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.baseShimmerColor;
    final highlightColor = AppColors.highLightShimmerColor;

    return RepaintBoundary(
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          width: 74.w,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            border: Border.all(color: baseColor, width: 1.w),
            color: Colors.white,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Center(
            child: Container(
              width: 40.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
