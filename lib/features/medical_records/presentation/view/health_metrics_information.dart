import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';

class HealthMetricsInformation extends StatelessWidget {
  const HealthMetricsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w , vertical:12.h),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(child: GeneralHeader(title: AppStrings.healthMetrics),),
            SliverToBoxAdapter(child: SizedBox(height: 12.h,),),
          ]),
        ),
      ),
    );
  }
}
