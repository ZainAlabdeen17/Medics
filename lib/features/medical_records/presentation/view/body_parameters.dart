import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/custom_text_field.dart';
import 'package:medics/features/medical_records/data/health_metric_model.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/general_header_health_metrics.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/blood_type.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/small_custom_text_field.dart';

class BodyParameters extends StatefulWidget {
  const BodyParameters({super.key});

  @override
  State<BodyParameters> createState() => _BodyParametersState();
}

class _BodyParametersState extends State<BodyParameters> {
  late TextEditingController heightCtrl;
  late TextEditingController weightCtrl;
  late TextEditingController oxygenCtrl;
  late TextEditingController heartRateCtrl;
  late TextEditingController systolicCtrl;
  late TextEditingController diastolicCtrl;

  String selectedBloodType = "B(III)";
  String selectedRh = "+";

  bool _isFirstLoad = true;

  @override
  void initState() {
    super.initState();

    heightCtrl = TextEditingController();
    weightCtrl = TextEditingController();
    oxygenCtrl = TextEditingController();
    heartRateCtrl = TextEditingController();
    systolicCtrl = TextEditingController();
    diastolicCtrl = TextEditingController();


  }

  @override
  void dispose() {
    heightCtrl.dispose();
    weightCtrl.dispose();
    oxygenCtrl.dispose();
    heartRateCtrl.dispose();
    systolicCtrl.dispose();
    diastolicCtrl.dispose();
    super.dispose();
  }

  void _onSave() {
    final height = double.tryParse(heightCtrl.text);
    final weight = double.tryParse(weightCtrl.text);
    final oxygen = int.tryParse(oxygenCtrl.text);
    final heartRate = int.tryParse(heartRateCtrl.text);
    final systolic = int.tryParse(systolicCtrl.text);
    final diastolic = int.tryParse(diastolicCtrl.text);

    if (height == null ||
        weight == null ||
        oxygen == null ||
        heartRate == null ||
        systolic == null ||
        diastolic == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Enter valid data ")));
      return;
    }

    final newBody = BodyParametersModel(
      height: height,
      weight: weight,
      oxygen: oxygen,
      heartRate: heartRate,
      systolic: systolic,
      diastolic: diastolic,
      bloodType: selectedBloodType,
      rh: selectedRh,
    );

    context.read<HealthCubit>().updateBody(newBody);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state is HealthError) {
            return Center(child: Text('error: ${state.message}'));
          }

          if (state is HealthLoaded) {
            final body = state.model.body;

            if (_isFirstLoad ) {
              _isFirstLoad = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                heightCtrl.text = body.height?.toString() ?? "";
                weightCtrl.text = body.weight?.toString() ?? "";
                oxygenCtrl.text = body.oxygen?.toString() ?? "";
                heartRateCtrl.text = body.heartRate?.toString() ?? "";
                systolicCtrl.text = body.systolic?.toString() ?? "";
                diastolicCtrl.text = body.diastolic?.toString() ?? "";

                setState(() {
                  selectedBloodType = body.bloodType ?? "B(III)";
                  selectedRh = body.rh ?? "+";
                });
              });
            }
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeaderHealthMetrics(
                      title: AppStrings.bodyParameters,
                      onSave: _onSave,
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
                                controller: heightCtrl,
                                keyboardType: TextInputType.number,
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
                                controller: weightCtrl,
                                keyboardType: TextInputType.number,
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
                      controller: oxygenCtrl,
                      keyboardType: TextInputType.number,
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
                      controller: heartRateCtrl,
                      keyboardType: TextInputType.number,
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
                            controller: systolicCtrl,
                            keyboardType: TextInputType.number,
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
                            controller: diastolicCtrl,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                  SliverToBoxAdapter(
                    child: BloodType(
                      initialBloodType: selectedBloodType,
                      initialRh: selectedRh,
                      onBloodTypeChanged: (type) {
                        setState(() {
                          selectedBloodType = type;
                        });
                      },
                      onRhChanged: (rh) {
                        setState(() {
                          selectedRh = rh;
                        });
                      },
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
