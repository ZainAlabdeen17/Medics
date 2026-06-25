import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DayChipShimmer extends StatelessWidget {
  const DayChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // Adjust these colors to match your app's dark/light theme
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[50]!,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: Colors
                .white, // Color doesn't matter much here, Shimmer overrides it
            width: 1.w,
          ),
          // A solid color is required here for the Shimmer package to "catch" the background
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Month Placeholder
            Container(
              width: 24.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.black, // Shimmer will paint over this
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),

            SizedBox(height: 6.h),

            // Day Placeholder
            Container(
              width: 28.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),

            SizedBox(height: 4.h),

            // Weekday Placeholder
            Container(
              width: 32.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
