import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/day_chip.dart';
import 'package:medics/features/doctor/presentation/widgets/shimmers/day_chip_shimmer.dart';

class DaySlotsSection extends StatelessWidget {
  const DaySlotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final book = BlocProvider.of<BookCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.availability,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12.h),
            BlocBuilder<DoctorCubit, DoctorState>(
              builder: (context, state) {
                final days = state is GetDaysSuccess ? state.days : [];
                if (state is GetDaysFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                }
                return state is GetDaysLoading
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: const DayChipShimmer(),
                            ),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(days.length, (index) {
                            final day = days[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: DayChip(
                                month: day.monthName,
                                day: int.parse(day.dayNumber),
                                weekDay: day.dayName,
                                isSelected:
                                    book.isDaySelected(day), // You can implement selection logic here
                                onTap: () {
                                  book.toggleDaySelection(day);
                                },
                              ),
                            );
                          }),
                        ),
                      );
              },
            ),
          ],
        );
      },
    );
  }
}
