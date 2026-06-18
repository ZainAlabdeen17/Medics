import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/doctor_tryal_model.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.doctor});
  final DoctorTrialModel doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: AssetImage(doctor.image),
              backgroundColor: AppColors.borderPrimary,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    doctor.name,
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),

                  Text(
                    doctor.specialization,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
