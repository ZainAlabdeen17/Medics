import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:medics/features/medical_records/presentation/cubit/prescription_cubit/prescription_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/prescription_cubit/prescription_state.dart';
import 'package:medics/features/medical_records/presentation/view/widgets/medication_item.dart';

class Prescription extends StatelessWidget {
  const Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
            builder: (context, state) {
              if (state is PrescriptionLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.borderAccent,
                  ),
                );
              } else if (state is PrescriptionError) {
                return Center(child: Text(state.message));
              } else if (state is PrescriptionSuccess) {
                return CustomScrollView(
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
                      itemCount: state.prescriptions.length,
                      itemBuilder: (context, index) {
                        return MedicationItem(medication: state.prescriptions[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
