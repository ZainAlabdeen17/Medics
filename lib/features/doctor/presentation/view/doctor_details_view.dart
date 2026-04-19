import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_badge.dart';
import 'package:medics/features/doctor/presentation/widgets/doctor_details_header.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: DoctorDetailsHeader(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: DoctorDetailsBadge(doctor: doctor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
