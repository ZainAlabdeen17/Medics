import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class RateChip extends StatelessWidget {
  const RateChip({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 62.w,
      // height: 32.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          SizedBox(
            height: 21.h,
            width: 21.w,
            child: SvgPicture.asset(Assets.assetsImagesIconsGeneralStar),
          ),
          SizedBox(width: 4.w),
          Text(
            "$rating",
            style: AppTextStyles.num1.copyWith(color: AppColors.textSecondary),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
