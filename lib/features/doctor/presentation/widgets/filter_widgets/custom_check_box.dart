import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCheckBox({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.borderAccent, width: 1.w),
        ),
        child: isSelected
            ? Center(
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsGeneralCheck,
                  width: 10.w,
                  height: 7.8.h,
                ),
              )
            : null,
      ),
    );
  }
}
