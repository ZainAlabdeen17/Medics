import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/medication_item.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    final medications = Medication.getMedications();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: AppStrings.prescription),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(
                child: HomeSearchField(
                  hintText: AppStrings.startTypingMedicationName,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverList.separated(
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  return MedicationItem(medication: medications[index]);
                },
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
