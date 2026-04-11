import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/view/widgets/doctor_item.dart';
import 'package:medics/features/home/presentation/view/widgets/section_header.dart';

class OurDoctorsSection extends StatelessWidget {
  const OurDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        SectionHeader(title: AppStrings.ourDoctors, onTap: () {}),
        SizedBox(height: 12.h),
        SizedBox(
          height: 530.h,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 28.h,
              childAspectRatio: 166.w / 250.h,
            ),
            itemBuilder: (context, index) {
              return DoctorItem(
                doctorName: doctors[index].name,
                doctorSpecialization: doctors[index].specialization,
                image: doctors[index].image,
                rating: doctors[index].rating,
              );
            },
          ),
        ),
      ],
    );
  }
}
