import 'package:dashed_border/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class OptionalAttachSection extends StatelessWidget {
  const OptionalAttachSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.optionalAttachment,
          style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 160.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceBlur,
            borderRadius: BorderRadius.circular(24.r),
            border: DashedBorder(
              color: AppColors.borderPrimary,
              width: 1.w,
              dashLength: 12.0,
              dashGap: 6.0,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.assetsImagesIconsGeneralAttache,
              width: 64,
              height: 64,
              colorFilter: ColorFilter.mode(
                AppColors.iconGreyDisabled,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
