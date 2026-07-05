import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/metric_space.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/metric_row.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/metric_section_header.dart';

class HealthMetricsInformation extends StatelessWidget {
  const HealthMetricsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HealthCubit, HealthState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: GeneralHeader(title: AppStrings.healthMetrics),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MetricSectionHeader(
                          title: AppStrings.bodyParameters,
                          editRoute: '/BodyParameters',
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.height,
                          value: state.height.isNotEmpty ? state.height : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.weight,
                          value: state.weight.isNotEmpty ? state.weight : null,
                        ),
                        const MetricSpace(),

                        MetricRow(title: AppStrings.bmi, value: state.bmi),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.oxygenSaturation,
                          value: state.oxygen.isNotEmpty ? state.oxygen : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.bloodPressure,
                          value: state.bloodPressure.isNotEmpty
                              ? state.bloodPressure
                              : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.heartRate,
                          value: state.heartRate.isNotEmpty
                              ? state.heartRate
                              : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.bloodType,
                          value: state.bloodType,
                        ),

                        SizedBox(height: 22.h),

                        // Lifestyle
                        MetricSectionHeader(
                          title: AppStrings.lifestyle,
                          editRoute: '/LifeStyle',
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.sleep,
                          value: state.sleep.isNotEmpty ? state.sleep : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.waterIntake,
                          value: state.water.isNotEmpty ? state.water : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.smoking,
                          value: state.smoking.isNotEmpty
                              ? state.smoking
                              : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.alcohol,
                          value: state.alcohol.isNotEmpty
                              ? state.alcohol
                              : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.activityLevel,
                          value: state.activity.isNotEmpty
                              ? state.activity
                              : null,
                        ),

                        SizedBox(height: 22.h),

                        // Anamnesis
                        MetricSectionHeader(
                          title: AppStrings.anamnesis,
                          editRoute: '/Anamnesis',
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.chronicConditions,
                          value: state.conditions.isNotEmpty
                              ? state.conditions
                              : null,
                        ),
                        const MetricSpace(),

                        MetricRow(
                          title: AppStrings.allergies,
                          value: state.allergies.isNotEmpty
                              ? state.allergies
                              : null,
                        ),

                        SizedBox(height: 22.h),

                        // Notes
                        MetricSectionHeader(
                          title: AppStrings.notes,
                          editRoute: '/Notes',
                        ),
                        const MetricSpace(),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            state.notes.isNotEmpty ? state.notes : '—',
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
