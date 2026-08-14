import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';

class Anamnesis extends StatelessWidget {
  const Anamnesis({super.key});

  Future<void> _onSave(BuildContext context) async {
    final cubit = context.read<HealthCubit>();
    await cubit.save();
    if (context.mounted) {
      Navigator.pop(context);
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
                      title: AppStrings.anamnesis,
                      onSave: () => _onSave(context),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.chronicConditions,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(
                    child: CustomTextField(
                      hintText: AppStrings.migraines,
                      initialValue: state.conditions,
                      onChanged: cubit.updateConditions,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.allergies,
                      style: AppTextStyles.body1.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 4.h)),
                  SliverToBoxAdapter(
                    child: CustomTextField(
                      hintText: AppStrings.peanuts,
                      initialValue: state.allergies,
                      onChanged: cubit.updateAllergies,
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