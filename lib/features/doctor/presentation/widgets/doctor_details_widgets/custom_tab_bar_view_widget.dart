import 'package:flutter/material.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/view/tabs/doctor_about_content.dart';
import 'package:medics/features/doctor/presentation/view/tabs/doctor_book_content.dart';
import 'package:medics/features/doctor/presentation/view/tabs/doctor_review_content.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        DoctorBookContent(),
        DoctorAboutContent(doctor: doctor),
        DoctorReviewContent(doctor: doctor),
      ],
    );
  }
}
