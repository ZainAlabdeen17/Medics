import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';

class AIChatButton extends StatelessWidget {
  const AIChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push("/AIChat"),
      borderRadius: BorderRadius.circular(50),

      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderBlack, width: 1.5.w),
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.assetsImagesIconsGeneralAi2,
            width: 26.w,
            height: 26.h,
            colorFilter: ColorFilter.mode(
              AppColors.iconAccent,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
