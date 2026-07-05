import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';

class BookingReasonTextField extends StatelessWidget {
  const BookingReasonTextField({super.key, this.maxLines = 8});
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final bookCubit = context.read<BookCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Reason",
          style: AppTextStyles.head3.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        CustomTextField(
          hintText: "Enter the reason for your visit...",
          maxLines: maxLines,
          isBigFeild: true,
          onChanged: (reason) {
            bookCubit.updateReason(reason);
          },
        ),
      ],
    );
  }
}
