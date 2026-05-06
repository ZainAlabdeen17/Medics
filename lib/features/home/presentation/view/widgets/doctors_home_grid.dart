import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_item.dart';

class DoctorsHomeGrid extends StatelessWidget {
  const DoctorsHomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> doctors = DoctorModel.getDoctors();
    return SliverGrid.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.w,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 32.h,
        mainAxisExtent: 250.h,
      ),
      itemBuilder: (context, index) {
        return DoctorItem(doctor: doctors[index]);
      },
    );
  }
}
