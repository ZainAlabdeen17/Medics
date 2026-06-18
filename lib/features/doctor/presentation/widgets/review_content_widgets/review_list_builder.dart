import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/features/doctor/data/models/review_model.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_item.dart';

class ReviewListBuilder extends StatelessWidget {
  const ReviewListBuilder({super.key, required this.reviews});
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewItem(review: reviews[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
    );
  }
}
