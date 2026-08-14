import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class DayChipShimmer extends StatelessWidget {
  const DayChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Shimmer.fromColors(
        baseColor: AppColors.baseShimmerColor,
        highlightColor: AppColors.highLightShimmerColor,
        child: Container(
          width: 60.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.baseShimmerColor, width: 1.w),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.baseShimmerColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 6),
              Container(
                width: 24.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColors.baseShimmerColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 6),
              Container(
                width: 35.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.baseShimmerColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
