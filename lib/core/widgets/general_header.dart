import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/functions/app_navigation.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class GeneralHeader extends StatelessWidget {
  const GeneralHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigation.popScreen(context);
              },
              child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrowLeft),
            ),
            SizedBox(width: 94.w),
            Text(
              title,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
