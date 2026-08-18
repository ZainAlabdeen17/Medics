import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class IncomingMessageBubble extends StatelessWidget {
  const IncomingMessageBubble({
    super.key,
    required this.sender,
    required this.body,
    required this.time,
  });
  final String sender;
  final String body;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.only(top: 12.h, right: 44.w),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                sender,
                style: AppTextStyles.head4.copyWith(
                  color: AppColors.textPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                body,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.textSecondary,
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
