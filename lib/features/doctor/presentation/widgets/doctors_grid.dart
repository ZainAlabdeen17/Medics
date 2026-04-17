import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_item.dart';

class DoctorsGrid extends StatelessWidget {
  const DoctorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> doctors = DoctorModel.getDoctors();
    return SliverGrid.builder(
      itemCount: doctors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 28.h,
        mainAxisExtent: 250.h,
      ),
      itemBuilder: (context, index) {
        return DoctorItem(doctor: doctors[index]);
      },
    );
  }
}
