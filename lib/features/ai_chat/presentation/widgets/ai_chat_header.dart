// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AiChatHeader extends StatelessWidget {
  const AiChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrowLeft),
            ),
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.surfaceAccent.withOpacity(0.12),
            child: Icon(
              Icons.smart_toy_rounded,
              color: AppColors.surfaceAccent,
              size: 22.r,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Medics AI",
                style: AppTextStyles.head4.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Online • Medical Assistant",
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
