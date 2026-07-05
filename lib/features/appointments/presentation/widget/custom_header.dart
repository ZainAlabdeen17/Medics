import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title, this.onTrailingPressed});
  final String title;
  final VoidCallback? onTrailingPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsGeneralArrowLeft,
                ),
              ),
            ),
            Text(
              title,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onTrailingPressed,
                child: SizedBox(
                  child: SvgPicture.asset(
                    Assets.assetsImagesIconsGeneralMore,
                    colorFilter: ColorFilter.mode(
                      AppColors.iconGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
