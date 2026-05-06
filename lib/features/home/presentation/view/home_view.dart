import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/home/presentation/view/widgets/doctors_home_grid.dart';
import 'package:medics/features/home/presentation/view/widgets/home_header.dart';
import 'package:medics/features/home/presentation/view/widgets/home_search_field.dart';
import 'package:medics/features/home/presentation/view/widgets/our_doctors_section.dart';
import 'package:medics/features/home/presentation/view/widgets/popular_spec_section.dart';
import 'package:medics/features/home/presentation/view/widgets/services_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeHeader()),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(
                child: HomeSearchField(
                  hintText: AppStrings.startTyping,
                  onTap: () {
                    context.push("/Doctors");
                  },
                  readOnly: true,
                ),
              ),
              SliverToBoxAdapter(child: PopularSpecializationsSection()),
              SliverToBoxAdapter(child: SizedBox(height: 12.h)),
              SliverToBoxAdapter(child: OurDoctorsSection()),
              DoctorsHomeGrid(),
              SliverToBoxAdapter(child: ServicesSection()),
              SliverToBoxAdapter(child: SizedBox(height: 90.h)),
            ],
          ),
        ),
      ),
    );
  }
}
