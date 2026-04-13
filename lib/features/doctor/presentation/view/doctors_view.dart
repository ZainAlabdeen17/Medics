import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/doctor/presentation/view/widgets/doctors_grid.dart';
import 'package:medics/features/doctor/presentation/view/widgets/search_and_filter.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
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
    );
  }
}
