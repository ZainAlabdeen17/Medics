import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/button_class.dart';
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

  void nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ButtonClass.customFillButton(
            text: AppStrings.next,
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
                    PersonalData(),
                    EmergencyContact(),
                    HealthAssessment(),
                    LifeStyleInformation(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
