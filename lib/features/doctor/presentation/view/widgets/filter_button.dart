import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.9, -0.9),
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            border: Border.all(color: AppColors.borderBlack, width: 1.w),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.assetsImagesIconsGeneralFilter,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        Container(
          width: 14.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: AppColors.surfaceAccent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
