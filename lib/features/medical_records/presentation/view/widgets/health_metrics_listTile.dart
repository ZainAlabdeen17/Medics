import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class HealthMetrixListTile extends StatelessWidget {
  final String title;
  final String location;
  const HealthMetrixListTile({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(Assets.assetsImagesIconsGeneralPlus),
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: () {
              context.push(location);
            },
            child: Text(
              AppStrings.add,
              style: AppTextStyles.head3.copyWith(color: AppColors.textAccent),
            ),
          ),
        ],
      ),
    );
  }
}
