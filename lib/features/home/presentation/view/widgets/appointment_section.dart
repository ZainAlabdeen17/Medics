import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.appointments,
          style: AppTextStyles.head2.copyWith(color: AppColors.textPrimary),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {
            context.push("/Appointments");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 140.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surfaceBlur,
              border: Border.all(color: AppColors.borderBlack, width: 1.w),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "See Your\nUpcoming",
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Appointments",
                      style: AppTextStyles.head2.copyWith(
                        color: AppColors.textAccent,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Container(
                  width: 120.w,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Assets.assetsImagesDoctorsDoctor8),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
