import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.image,
    required this.rating,
  });
  final String doctorName;
  final String doctorSpecialization;
  final String image;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 1.2),
      children: [
        Container(
          height: 241.h,
          width: 166.w,
          padding: EdgeInsets.symmetric(horizontal: 12.5.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceBlur,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.borderBlack, width: 1.w),
          ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 141.w,
                    height: 141.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                    child: Container(
                      width: 62.w,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceCard,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              Assets.assetsImagesIconsGeneralStar,
                            ),
                          ),
                          Padding(
                            // padding: EdgeInsets.only(top: 2.5.h, bottom: 4.h),
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Text(
                              "$rating",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontFamily: "Syne",
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                doctorName,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              Text(
                doctorSpecialization,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          height: 44.h,
          width: 44.w,
          decoration: BoxDecoration(
            color: AppColors.surfaceAccent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(Assets.assetsImagesIconsGeneralArrow),
            ),
          ),
        ),
      ],
    );
  }
}
