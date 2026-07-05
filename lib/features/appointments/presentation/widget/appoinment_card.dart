import 'package:cached_network_image/cached_network_image.dart';
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
  final String status;
  final String imagePath;
  final VoidCallback? onTap;
  final VoidCallback? onMoreActionTap;
  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.imagePath,
    required this.status,
    this.onTap,
    this.onMoreActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 153.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surfaceBlur,
          border: Border.all(color: AppColors.borderBlack, width: 1.w),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 22.r,
                backgroundImage: CachedNetworkImageProvider(imagePath),
                backgroundColor: AppColors.borderPrimary,
              ),

              title: Text(
                doctorName,
                style: AppTextStyles.head3.copyWith(
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                specialty,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: GestureDetector(
                onTap: onMoreActionTap,
                child: Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: SvgPicture.asset(
                        Assets.assetsImagesIconsGeneralMore,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: SvgPicture.asset(
                    Assets.assetsImagesAppointmentsCalendar,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "$date , $time",
                  style: AppTextStyles.body2.copyWith(
                    color: AppColors.textSecondary,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: SvgPicture.asset(
                    Assets.assetsImagesAppointmentsVerification,
                    colorFilter: ColorFilter.mode(
                      AppColors.iconAccent,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: status == 'pending'
                        ? AppColors.surfaceOrange
                        : status == 'completed'
                        ? AppColors.surfaceGreen
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: AppTextStyles.body2.copyWith(
                        color: status == 'pending'
                            ? AppColors.textOrange
                            : status == 'completed'
                            ? AppColors.textGreen
                            : AppColors.textSecondary,
                        fontFamily: "Inter",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
