import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TimeChipShimmer extends StatelessWidget {
  const TimeChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[200]!;
    final highlightColor = Colors.grey[50]!;

    return Shimmer.fromColors(
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
    );
  }
}
