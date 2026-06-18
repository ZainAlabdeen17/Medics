import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/data/doctor_tryal_model.dart';
import 'package:medics/features/doctor/data/review_model.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_list_builder.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_section_header.dart';

class DoctorReviewContent extends StatelessWidget {
  const DoctorReviewContent({super.key, required this.doctor});
  final DoctorTrialModel doctor;

  @override
  Widget build(BuildContext context) {
    final reviews = ReviewModel.getDummyReviews();
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15.h, bottom: 5.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ReviewSectionHeader(doctor: doctor, reviews: reviews),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ReviewListBuilder(reviews: reviews),
        ],
      ),
    );
  }
}
