import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:medics/features/doctor/presentation/widgets/doctors_grid.dart';
import 'package:medics/features/doctor/presentation/widgets/search_and_filter.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: RefreshIndicator(
            backgroundColor: AppColors.surfaceCard,
            color: AppColors.surfaceAccent,
            onRefresh: () async {
              final filterCubit = context.read<FilterCubit>();
              final doctorCubit = context.read<DoctorCubit>();
              final filterState = filterCubit.state;
              await doctorCubit.getDoctors(
                searchQuery: filterState.searchQuery,
                specializations: filterState.selectedSpecializations,
                experience: filterState.selectedExperience as String?,
                gender: filterState.selectedGender as String?,
              );
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: GeneralHeader(title: "Doctors")),
                SliverToBoxAdapter(child: SizedBox(height: 8.0.h)),
                SliverToBoxAdapter(child: SearchAndFilter()),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                DoctorsGrid(),
                SliverToBoxAdapter(child: SizedBox(height: 30.h)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
