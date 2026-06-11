import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;
  final String time;

  final String imagePath;
  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,

    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 153.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceBlur,

        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.asset(
                imagePath,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              doctorName,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
            ),
            subtitle: Text(
              specialty,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            trailing: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesIconsGeneralCalendar),
                  SizedBox(width: 8.w),
                  Text(
                    "$date , $time",
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesIconsGeneralComputer),
                  SizedBox(width: 8.w),
                  Text(
                    "Virtual",
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
