import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:medics/core/utils/app_colors.dart';

class DoctorItemShimmer extends StatelessWidget {
  const DoctorItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = AppColors.baseShimmerColor;
    final Color highlightColor = AppColors.highLightShimmerColor;
    return Stack(
      alignment: const Alignment(0, 1.2),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceBlur,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.borderBlack, width: 1.w),
          ),
          child: Column(
            children: [
              RepaintBoundary(
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 141.w,
                    height: 141.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              RepaintBoundary(
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 100.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              RepaintBoundary(
                child: Shimmer.fromColors(
                  baseColor: baseColor,
                  highlightColor: highlightColor,
                  child: Container(
                    width: 65.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        RepaintBoundary(
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              height: 44.h,
              width: 44.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
