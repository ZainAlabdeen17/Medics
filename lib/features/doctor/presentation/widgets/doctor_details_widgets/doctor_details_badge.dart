import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/doctor_tryal_model.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/id_chip.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_widgets/rate_chip.dart';

class DoctorDetailsBadge extends StatelessWidget {
  const DoctorDetailsBadge({super.key, required this.doctor});
  final DoctorTrialModel doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: SizedBox(
        width: double.infinity,
        height: 264.h,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Hero(
                tag: doctor.id,
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
            ),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: SizedBox(
                width: 190.w,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: doctor.name,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          doctor.name,
                          style: AppTextStyles.head2.copyWith(
                            color: AppColors.textPrimary,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
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
                        Material(
                          color: Colors.transparent,
                          child: Hero(
                            tag: "${doctor.id},${doctor.rating}",
                            child: RateChip(rating: doctor.rating),
                          ),
                        ),
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
      ),
    );
  }
}
