import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class MetricSectionHeader extends StatelessWidget {
  final String title;
  final String editRoute;

  const MetricSectionHeader({
    super.key,
    required this.title,
    required this.editRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          ),
          GestureDetector(
            onTap: () => context.push(editRoute),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                Assets.assetsImagesIconsGeneralEdit,
                colorFilter: ColorFilter.mode(
                  AppColors.borderSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
