import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_state.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_item.dart';
import 'package:medics/features/doctor/presentation/widgets/shimmers/doctor_item_shimmer.dart';

class DoctorsGrid extends StatelessWidget {
  const DoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        final doctors = state is DoctorSuccess ? state.doctors : [];
        if (state is DoctorFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          );
        }
        return state is DoctorLoading
            ? SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 32.h,
                  mainAxisExtent: 250.h,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const DoctorItemShimmer(),
                  childCount: 6,
                ),
              )
            : SliverGrid.builder(
                itemCount: doctors.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 32.h,
                  mainAxisExtent: 250.h,
                ),
                itemBuilder: (context, index) {
                  return DoctorItem(doctor: doctors[index]);
                },
              );
      },
    );
  }
}
