import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
          ],
        ),
      ),
    );
  }
}
