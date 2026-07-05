import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_cubit.dart';

class AppointmentActionsBottomSheet extends StatelessWidget {
  final AppointmentModel appointment;
  final AppointmentCubit appointmentCubit;
  const AppointmentActionsBottomSheet({
    super.key,
    required this.appointment,
    required this.appointmentCubit,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPending = appointment.status.toLowerCase() == 'pending';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'More options',
            style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 5.h),
          ListTile(
            title: Text(
              'View doctor\'s profile',
              style: AppTextStyles.body1.copyWith(color: AppColors.textPrimary),
            ),
            trailing: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                Assets.assetsImagesIconsGeneralArrowRight,
              ),
            ),
            onTap: () {
              context.pop();
              context.push(
                '/DoctorDetails',
                extra: {'doctor': appointment.doctor},
              );
            },
          ),

          if (isPending) ...[
            ListTile(
              title: Text(
                'Reschedule appointment',
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              trailing: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsGeneralArrowRight,
                ),
              ),
              onTap: () {
                context.pop();
                context.push(
                  "/RescheduleAppointment",
                  extra: {
                    'appointment': appointment,
                    'appointment_cubit': appointmentCubit,
                  },
                );
              },
            ),
            ListTile(
              title: Text(
                'Cancel appointment',
                style: AppTextStyles.body1.copyWith(color: AppColors.textRed),
              ),
              trailing: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  Assets.assetsImagesIconsGeneralArrowRight,
                ),
              ),
              onTap: () {
                context.pop();
                context.push(
                  '/CancelAppointment',
                  extra: {
                    'appointment': appointment,
                    'appointment_cubit': appointmentCubit,
                  },
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
