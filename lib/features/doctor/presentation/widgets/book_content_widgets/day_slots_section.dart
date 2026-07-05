import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/day_chip.dart';
import 'package:medics/features/doctor/presentation/widgets/shimmers/day_chip_shimmer.dart';

class DaySlotsSection extends StatelessWidget {
  const DaySlotsSection({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.availability,
          style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            final book = context.read<BookCubit>();
            if (state.isLoadingDays) {
              return SingleChildScrollView(
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
              );
            }
            if (state.daysErrorMessage != null) {
              return Center(child: Text(state.daysErrorMessage!));
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(state.days.length, (index) {
                  final day = state.days[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: DayChip(
                      month: day.monthName,
                      day: int.parse(day.dayNumber),
                      weekDay: day.dayName,
                      isSelected: book.isDaySelected(
                        day,
                      ), // You can implement selection logic here
                      onTap: () {
                        book.toggleDaySelection(day, doctor.id);
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
  }
}

// SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: List.generate(
//                             5,
//                             (index) => Padding(
//                               padding: EdgeInsets.only(right: 12.w),
//                               child: const DayChipShimmer(),
//                             ),
//                           ),
//                         ),
//                       )
