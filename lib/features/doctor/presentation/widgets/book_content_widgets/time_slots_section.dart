import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/time_chip.dart';
import 'package:medics/features/doctor/presentation/widgets/shimmers/time_chip_shimmer.dart';

class TimeSlotsSection extends StatelessWidget {
  final DoctorModel? doctor;
  TimeSlotsSection({super.key, this.doctor});
  final slots = [
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.selectTime,
          style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            final book = context.read<BookCubit>();
            if (state.selectedDay == null) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      "Please select a date first to see available times",
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            }
            if (state.isLoadingTimes) {
              return Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                  TimeChipShimmer(),
                ],
              );
            }

            if (state.timesErrorMessage != null) {
              return Center(child: Text(state.timesErrorMessage as String));
            }
            if (state.availableTimes.isEmpty && state.selectedDay != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: SvgPicture.asset(
                      Assets.assetsImagesIconsGeneralDoctor,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "No available time slots",
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Dr. ${doctor?.firstName ?? ""} is unavailable. Please select a different date.",
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            }
            return Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: state.availableTimes.map((slot) {
                return TimeChip(
                  time: slot,
                  isSelected: book.isTimeSelected(slot),
                  onTap: () {
                    book.toggleTimeSelection(slot);
                  },
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
