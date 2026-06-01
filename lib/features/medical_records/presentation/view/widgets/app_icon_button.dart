import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AppIconButton extends StatelessWidget {
  final String text;
  final String iconName;
  final Color color;
  final VoidCallback onPressed;
  final bool isfill;
  const AppIconButton({
    super.key,
    required this.text,
    required this.iconName,
    required this.color,
    required this.onPressed,
    this.isfill = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppColors.borderAccent, width: 1.w),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 18.w,
              height: 18.h,
              child: SvgPicture.asset(
                iconName,
                colorFilter: ColorFilter.mode(
                  isfill ? AppColors.iconStaticWhite : AppColors.iconAccent,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              text,
              style: AppTextStyles.head3.copyWith(
                color: isfill
                    ? AppColors.textStaticWhite
                    : AppColors.textAccent,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
