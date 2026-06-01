import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/medical_records/data/health_metric_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';

class Anamnesis extends StatefulWidget {
  const Anamnesis({super.key});

  @override
  State<Anamnesis> createState() => _AnamnesisState();
}

class _AnamnesisState extends State<Anamnesis> {
  late TextEditingController conditions;
  bool isInitialized = false;

  late TextEditingController allergies;

  @override
  void initState() {
    super.initState();
    conditions = TextEditingController();
    allergies = TextEditingController();
  }

  @override
  void dispose() {
    conditions.dispose();
    allergies.dispose();
    super.dispose();
  }

  void _onSave() {
    final conditionsRaw = conditions.text.trim();
    final allergiesRaw = allergies.text.trim();

    if (conditionsRaw.isEmpty && allergiesRaw.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    final anamnesis = AnamnesisModel(
      conditions: conditionsRaw,
      allergies: allergiesRaw,
    );

    context.read<HealthCubit>().updateAnamnesis(anamnesis);
    Navigator.pop(context);
  }

  void _fillControllers(AnamnesisModel? anamnesis) {
    conditions.text = anamnesis?.conditions ?? "";
    allergies.text = anamnesis?.allergies ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state is HealthError) {
            return Center(child: Text('errors: ${state.message}'));
          }

          if (state is HealthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HealthLoaded && !isInitialized) {
            _fillControllers(state.model.anamnesis);
            isInitialized = true;
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeaderHealthMetrics(
                      title: AppStrings.anamnesis,
                      onSave: _onSave,
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
                      controller: conditions,
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
                      controller: allergies,
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
