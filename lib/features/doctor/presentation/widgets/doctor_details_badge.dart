import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/id_chip.dart';
import 'package:medics/features/doctor/presentation/widgets/rate_chip.dart';

class DoctorDetailsBadge extends StatelessWidget {
  const DoctorDetailsBadge({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 264.h,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: Container(
              width: 264.w,
              height: 264.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(doctor.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: SizedBox(
              width: 190.w,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctor.name,
                    style: AppTextStyles.head2.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    doctor.specialization,
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RateChip(rating: doctor.rating),
                      SizedBox(width: 4.w),
                      IdChip(id: doctor.id),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
