import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/rate_chip.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/DoctorDetails", extra: doctor);
      },
      child: Stack(
        alignment: Alignment(0, 1.2),
        children: [
          Container(
            // height: 241.h,
            // width: 166.w,
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
                    Hero(
                      tag: doctor.id,
                      child: Container(
                        width: 141.w,
                        height: 141.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(doctor.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                      child: Hero(
                        tag: "${doctor.id},${doctor.rating}",
                        child: RateChip(rating: doctor.rating),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Hero(
                  tag: doctor.name,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      doctor.name,
                      style: AppTextStyles.head3.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Text(
                  doctor.specialization,
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
          GestureDetector(
            onTap: () {
              context.push("/DoctorDetails", extra: doctor);
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
