import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/specialization/data/specialization_model.dart';
import 'package:medics/features/home/presentation/view/widgets/section_header.dart';
import 'package:medics/features/specialization/presentation/view/widget/specialization_item.dart';

class PopularSpecializationsSection extends StatelessWidget {
  const PopularSpecializationsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        SectionHeader(
          title: AppStrings.popularSpecializations,
          onTap: () {
            context.push("/Specializations");
          },
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 250.h,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SpecializationItem(
                specializationName: specializations[index].name,
                icon: specializations[index].icon,
                doctorsCount: specializations[index].doctorsCount,
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
