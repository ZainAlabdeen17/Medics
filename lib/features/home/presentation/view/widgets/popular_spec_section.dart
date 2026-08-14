import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/home/presentation/view/widgets/section_header.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_cubit.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_state.dart';
import 'package:medics/features/specialization/presentation/view/widget/specialization_item.dart';

class PopularSpecializationsSection extends StatelessWidget {
  const PopularSpecializationsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationCubit, SpecializationState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: 12.h),
            SectionHeader(
              title: AppStrings.popularSpecializations,
              onTap: () {
                context.push(
                  "/Specializations",
                  extra: context.read<SpecializationCubit>(),
                );
              },
            ),
            SizedBox(height: 12.h),
            state is SpecializationLoading
                ? Column(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: SpecializationItem.skeleton(),
                      );
                    }),
                  )
                : state is SpecializationFailure
                ? Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  )
                : state is SpecializationSuccess
                ? state.specializations.isEmpty
                      ? Center(
                          child: Text(
                            "There is no specializations available",
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                            math.min(4, state.specializations.length),
                            (index) {
                              final specialization =
                                  state.specializations[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: SpecializationItem(
                                  specializationName:
                                      specialization.specialization,
                                  icon: specialization.icon,
                                  doctorsCount: specialization.doctorsCount,
                                ),
                              );
                            },
                          ),
                        )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
