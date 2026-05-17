import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';

class ReviewFormView extends StatelessWidget {
  const ReviewFormView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: AppStrings.reviewForm),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 65.h,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 65.h,
                          width: 65.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(doctor.image),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
