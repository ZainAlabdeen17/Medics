import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/presentation/widgets/exper_and_gen_filter_section.dart';
import 'package:medics/features/doctor/presentation/widgets/filter_header.dart';
import 'package:medics/features/doctor/presentation/widgets/reset_filter_section.dart';
import 'package:medics/features/doctor/presentation/widgets/spec_filter_section.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: FilterHeader()),
              SliverToBoxAdapter(child: SpecFilterSection()),
              SliverToBoxAdapter(child: ExperienceAndGenderFilterSection()),
              SliverToBoxAdapter(child: ResetFilterSection()),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            ],
          ),
        ),
      ),
    );
  }
}
