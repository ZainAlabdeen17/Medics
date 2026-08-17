import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/auth/data/models/user_model.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key, required this.user});

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.surfaceBlur,
          border: Border.all(color: AppColors.borderBlack),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 28.w,
            backgroundColor: AppColors.baseShimmerColor,
            child: SizedBox(
              width: 28.w,
              height: 28.w,
              child: SvgPicture.asset(Assets.assetsImagesIconsGeneralProfile),
            ),
          ),
          title: Text(
            "${user?.firstName ?? "User"} ${user?.lastName ?? ""}",
            style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          ),
          subtitle: Text(
            "Active User",
            style: AppTextStyles.body2.copyWith(color: AppColors.textGreen),
          ),
        ),
      ),
    );
  }
}
