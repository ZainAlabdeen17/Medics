import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: AppColors.surfaceBlur,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColors.borderBlack, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsGeneralArrow,
                  // ignore: deprecated_member_use
                  color: AppColors.iconAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
