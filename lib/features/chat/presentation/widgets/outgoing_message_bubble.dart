import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class OutgoingMessageBubble extends StatelessWidget {
  const OutgoingMessageBubble({
    super.key,
    required this.body,
    required this.time,
  });
  final String body;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.only(top: 12.h, left: 44.w),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          // alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.surfaceAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                body,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textStaticWhite,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.textStaticWhite,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
