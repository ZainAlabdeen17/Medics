import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/blood_type.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/small_custom_text_field.dart';

class BodyParameters extends StatelessWidget {
  const BodyParameters({super.key});

  Future<void> _onSave(BuildContext context) async {
    final cubit = context.read<HealthCubit>();
    await cubit.save();
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HealthCubit>();

    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeaderHealthMetrics(
                      title: AppStrings.bodyParameters,
                      onSave: () => _onSave(context),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.yourHieght,
                                style: AppTextStyles.body1.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              SmallCustomTextField(
                                hintText: AppStrings.enterYourHeight,
                                initialValue: state.height,
                                keyboardType: TextInputType.number,
                                onChanged: cubit.updateHeight,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.yourWeight,
                                style: AppTextStyles.body1.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              SmallCustomTextField(
                                hintText: AppStrings.enterYourWeight,
                                initialValue: state.weight,
                                keyboardType: TextInputType.number,
                                onChanged: cubit.updateWeight,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.oxygenSaturation,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(
                    child: CustomTextField(
                      hintText: "98",
                      initialValue: state.oxygen,
                      keyboardType: TextInputType.number,
                      onChanged: cubit.updateOxygen,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.heartRate,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(
                    child: CustomTextField(
                      hintText: "77",
                      initialValue: state.heartRate,
                      keyboardType: TextInputType.number,
                      onChanged: cubit.updateHeartRate,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.bloodPressure,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "120",
                            initialValue: state.systolic,
                            keyboardType: TextInputType.number,
                            onChanged: cubit.updateSystolic,
                          ),
                        ),
                        Text(
                          " / ",
                          style: AppTextStyles.head3.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            hintText: "88",
                            initialValue: state.diastolic,
                            keyboardType: TextInputType.number,
                            onChanged: cubit.updateDiastolic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                  SliverToBoxAdapter(
                    child: BloodType(
                      initialBloodType: state.bloodType,
                      initialRh: state.rh,
                      onBloodTypeChanged: cubit.updateBloodType,
                      onRhChanged: cubit.updateRh,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}