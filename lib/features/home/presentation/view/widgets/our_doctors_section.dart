import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/home/presentation/view/widgets/section_header.dart';

class OurDoctorsSection extends StatelessWidget {
  const OurDoctorsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.h),
        SectionHeader(
          title: AppStrings.ourDoctors,
          onTap: () {
            context.push("/Doctors");
          },
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
