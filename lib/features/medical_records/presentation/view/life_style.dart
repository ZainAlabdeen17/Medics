import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/button_groups_equals.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/activity_level_groups.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/button_groups.dart';

class LifeStyle extends StatelessWidget {
  const LifeStyle({super.key});

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
                      title: AppStrings.lifestyle,
                      onSave: () => _onSave(context),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                  // Sleep
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.sleep,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: ButtonGroupsEquals(
                      text1: "<7",
                      text2: "7 - 8",
                      text3: ">8",
                      initialValue: state.sleep,
                      onSelected: cubit.updateSleep,
                    ),
                  ),

                  // Water
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.waterIntake,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: ButtonGroupsEquals(
                      text1: "<1",
                      text2: "1 - 1.5",
                      text3: ">1.5",
                      initialValue: state.water,
                      onSelected: cubit.updateWater,
                    ),
                  ),

                  // Smoking
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.smoking,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: ButtonGroups(
                      text1: AppStrings.yes,
                      text2: AppStrings.no,
                      text3: AppStrings.occasionally,
                      initialValue: state.smoking,
                      onSelected: cubit.updateSmoking,
                    ),
                  ),

                  // Alcohol
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.alcohol,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                  SliverToBoxAdapter(
                    child: ButtonGroups(
                      text1: AppStrings.yes,
                      text2: AppStrings.no,
                      text3: AppStrings.occasionally,
                      initialValue: state.alcohol,
                      onSelected: cubit.updateAlcohol,
                    ),
                  ),

                  // Activity
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.activityLevel,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: ActivityLevelGroups(
                      initialValue: state.activity,
                      onSelected: cubit.updateActivity,
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
