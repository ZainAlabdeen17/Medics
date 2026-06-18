import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/presentation/widgets/about_content_widgets/about_widget.dart';

class DoctorAboutContent extends StatelessWidget {
  const DoctorAboutContent({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 5.h),
      child: ListView(
        key: const PageStorageKey<String>('DoctorAboutContent'),
        children: [
          AboutWidget(
            title: AppStrings.generalInformation,
            icon: Assets.assetsImagesIconsAboutDoctorFile,
            details: doctor.bio,
          ),
          // AboutWidget(
          //   title: AppStrings.currentWorkingPlace,
          //   icon: Assets.assetsImagesIconsAboutDoctorHospital,
          //   details: doctor.currentWorkPlace,
          // ),
          AboutWidget(
            title: AppStrings.education,
            icon: Assets.assetsImagesIconsAboutDoctorMortarboard,
            details: doctor.education,
          ),
          AboutWidget(
            title: AppStrings.certification,
            icon: Assets.assetsImagesIconsAboutDoctorDiploma,
            details: doctor.certification,
          ),
          // AboutWidget(
          //   title: AppStrings.training,
          //   icon: Assets.assetsImagesIconsAboutDoctorNote,
          //   details: doctor.training,
          // ),
          AboutWidget(
            title: AppStrings.licensure,
            icon: Assets.assetsImagesIconsAboutDoctorGraduationScroll,
            details: doctor.licenseNumber,
          ),
          // AboutWidget(
          //   title: AppStrings.experience,
          //   icon: Assets.assetsImagesIconsAboutDoctorStethoscope,
          //   details: doctor.,
          // ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
