import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_state.dart';
import 'package:medics/features/doctor/presentation/widgets/book_content_widgets/time_chip.dart';

class TimeSlotsSection extends StatelessWidget {
  TimeSlotsSection({super.key});
  final slots = [
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        final book = BlocProvider.of<BookCubit>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.selectTime,
              style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: slots.map((slot) {
                return TimeChip(
                  time: slot,
                  isSelected: book.isTimeSelected(slot),
                  onTap: () {
                    book.toggleTimeSelection(slot);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
