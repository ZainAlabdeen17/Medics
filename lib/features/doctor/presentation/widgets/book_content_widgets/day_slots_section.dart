import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/data/book_day_model.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/day_chip.dart';

class DaySlotsSection extends StatelessWidget {
  const DaySlotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final book = BlocProvider.of<BookCubit>(context);
        final days = BookDayModel.getDays();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.availability,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  days.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: DayChip(
                      month: days[index].month,
                      day: days[index].day,
                      weekDay: days[index].weekDay,
                      isSelected: book.isDaySelected(days[index]),
                      onTap: () {
                        book.toggleDaySelection(days[index]);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
