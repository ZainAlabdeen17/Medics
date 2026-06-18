import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/functions/show_custom_toast.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/button_class.dart';
import 'package:medics/features/patient_card/data/repositories/patient_repository.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';
import 'package:medics/features/patient_card/presentation/view/emergency_contact.dart';
import 'package:medics/features/patient_card/presentation/view/health_assessment.dart';
import 'package:medics/features/patient_card/presentation/view/life_style_information.dart';
import 'package:medics/features/patient_card/presentation/view/personal_data.dart';
import 'package:medics/features/patient_card/presentation/view/widgets/patient_header.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});
  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  late final PatientCardCubit _cubit;

  final GlobalKey<FormState> _personalDataFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emergencyContactFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _healthAssessmentFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _lifeStyleFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cubit = PatientCardCubit(patientRepository: getIt<PatientRepository>());
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  GlobalKey<FormState> getCurrentFormKey() {
    switch (_currentPage) {
      case 0:
        return _personalDataFormKey;
      case 1:
        return _emergencyContactFormKey;
      case 2:
        return _healthAssessmentFormKey;
      case 3:
        return _lifeStyleFormKey;

      default:
        return _lifeStyleFormKey;
    }
  }

  void nextPage() {
    final currentFormKey = getCurrentFormKey();
    final isValid = currentFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    if (_currentPage == 3) {
      _cubit.submitAll();
      return;
    }

    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      if (_currentPage < 3) {
        _currentPage++;
      }
    });
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<PatientCardCubit, PatientCardState>(
        listener: (context, state) {
          if (state.isSuccess) {
            showCustomToast(
              context: context,
              title: "Succesfull",
              primaryColor: AppColors.borderGreen,
              icon: Icon(Icons.check_sharp, color: AppColors.borderGreen),
            );
            context.pushReplacement("/Home");
          }

          if (state.errorMessage != null) {
            showCustomToast(
              context: context,
              title: state.errorMessage ?? 'Error',
              primaryColor: AppColors.iconRed,
              icon: Icon(Icons.cancel_outlined, color: AppColors.iconRed),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldColor,
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ButtonClass.customFillButton(
                        text: _currentPage == 3
                            ? AppStrings.saveData
                            : AppStrings.next,
                        onPressed: nextPage,
                      ),
              ),
            ),

            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    PatientHeader(onTap: previousPage, controller: _controller),
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          PersonalData(formKey: _personalDataFormKey),
                          EmergencyContact(formKey: _emergencyContactFormKey),
                          HealthAssessment(formKey: _healthAssessmentFormKey),
                          LifeStyleInformation(formKey: _lifeStyleFormKey),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
