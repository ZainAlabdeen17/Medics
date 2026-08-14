import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medics/core/utils/app_assets.dart';
import 'package:medics/core/utils/app_colors.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/utils/app_text_styles.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/appointments/presentation/view/appointment_details_view.dart';
import 'package:medics/features/medical_records/data/models/visit_model.dart';

class VisitSummaryDetails extends StatelessWidget {
  final VisitModel visit;
  const VisitSummaryDetails({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(visit.visitDate);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GeneralHeader(title: AppStrings.visitSummeries),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text(
                  "Appointment details",
                  style: AppTextStyles.head2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 22.r,
                    backgroundImage: CachedNetworkImageProvider(
                      visit.doctorPhotoUrl,
                    ),
                    backgroundColor: AppColors.borderPrimary,
                  ),
                  title: Text(
                    visit.doctorName,
                    style: AppTextStyles.head3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    visit.doctorSpecialization,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoPiece(
                      title: 'Date:',
                      icon: Assets.assetsImagesAppointmentsCalendar,
                      value: formattedDate,
                    ),
                    InfoPiece(
                      title: 'Type:',
                      icon: Assets.assetsImagesIconsAboutDoctorHospital,
                      value: "In-person visit",
                    ),
                    InfoPiece(
                      title: 'Location:',
                      icon: Assets.assetsImagesIconsGeneralLocation,
                      value: "Medics Medical Center",
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 4.h)),
              SliverToBoxAdapter(
                child: Text(
                  "Visit Reason",
                  style: AppTextStyles.head2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
