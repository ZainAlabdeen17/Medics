import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/button_class.dart';

void showLogOutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    animationStyle: AnimationStyle(
      curve: Curves.easeInQuad,
      duration: const Duration(milliseconds: 300),
    ),
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        backgroundColor: AppColors.surfaceCard,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64.w,
                height: 64.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceOrange,
                ),
                child: Center(
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: SvgPicture.asset(
                      Assets.assetsImagesIconsGeneralLogout2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Are you sure you \nwant to log out?",
                style: AppTextStyles.head2.copyWith(
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "While logged out, you may miss critical notifications and reminders",
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              ButtonClass.customFillButton(
                text: "Log out",
                onPressed: () {
                  context.pushReplacement("/SignOut");
                },
              ),
              SizedBox(height: 8.h),
              ButtonClass.customNonFillButton(
                text: "Cancel",
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}
