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
            if (state is HealthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HealthError) {
              return Center(child: Text(state.message));
            }

            if (state is HealthLoaded) {
              final body = state.model.body;
              final lifestyle = state.model.lifestyle;
              final anamnesis = state.model.anamnesis;
              final notes = state.model.notes;

              // حساب الـ BMI تلقائي
              // BMI = الوزن / (الطول بالمتر)^2
              String? bmi;
              if (body.height != null &&
                  body.weight != null &&
                  body.height! > 0) {
                final heightInMeters = body.height! / 100;
                final bmiValue =
                    body.weight! / (heightInMeters * heightInMeters);
                bmi = bmiValue.toStringAsFixed(1);
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
                            value: body.height?.toString(),
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.weight,
                            value: body.weight?.toString(),
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.bmi,
                            value: bmi, 
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.oxygenSaturation,
                            value: body.oxygen?.toString(),
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.bloodPressure,
                            value:
                                (body.systolic != null &&
                                    body.diastolic != null)
                                ? '${body.systolic}/${body.diastolic}'
                                : null,
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.heartRate,
                            value: body.heartRate?.toString(),
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.bloodType,
                            value: (body.bloodType != null && body.rh != null)
                                ? '${body.bloodType}${body.rh}'
                                : null,
                          ),

                          SizedBox(height: 22.h),

                          // Lifestyle
                          MetricSectionHeader(
                            title: AppStrings.lifestyle,
                            editRoute: '/LifeStyle',
                          ),
                          const MetricSpace(),

                          MetricRow(title: AppStrings.sleep, value: lifestyle.sleep),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.waterIntake,
                            value: lifestyle.water,
                          ),
                          const MetricSpace(),

                          MetricRow(title: AppStrings.smoking, value: lifestyle.smoking),
                          const MetricSpace(),

                          MetricRow(title: AppStrings.alcohol, value: lifestyle.alcohol),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.activityLevel,
                            value: lifestyle.activity,
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
                            value: anamnesis.conditions,
                          ),
                          const MetricSpace(),

                          MetricRow(
                            title: AppStrings.allergies,
                            value: anamnesis.allergies,
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
                              notes?.isNotEmpty == true ? notes! : '—',
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
        }
                return const SizedBox.shrink();
               },
        ),
      ),
    );
  }
}
