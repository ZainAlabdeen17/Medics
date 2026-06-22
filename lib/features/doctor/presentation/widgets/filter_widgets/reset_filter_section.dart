import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';

class ResetFilterSection extends StatelessWidget {
  const ResetFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          final filterCubit = context.read<FilterCubit>();
          final doctorCubit = context.read<DoctorCubit>();
          filterCubit.resetFilters();
          filterCubit.hasFilter();
          doctorCubit.getDoctors();
          context.pop();
        },
        child: Text(
          AppStrings.resetFilter,
          style: AppTextStyles.head3.copyWith(color: AppColors.textRed),
        ),
      ),
    );
  }
}
