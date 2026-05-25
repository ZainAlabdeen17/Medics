import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/core/utils/app_strings.dart';
import 'package:medics/core/widgets/general_header.dart';
import 'package:medics/features/doctor/data/doctor_model.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_state.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/big_text_review_form_field.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/doctor_info.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/leave_review_button.dart';
import 'package:medics/features/doctor/presentation/widgets/review_content_widgets/review_form_widgets/selection_star_row.dart';

class ReviewFormView extends StatelessWidget {
  const ReviewFormView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is ReviewSuccess) {
          context.pop(true);
        }
        if (state is ReviewFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("something went wrong, please try again later"),
            ),
          );
        }
      },
      builder: (context, state) {
        final reviewCubit = context.read<ReviewCubit>();
        return Scaffold(
          bottomNavigationBar: LeaveReviewButton(
            reviewCubit: reviewCubit,
            state: state,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: GeneralHeader(title: AppStrings.reviewForm),
                  ),
                  SliverToBoxAdapter(child: DoctorInfo(doctor: doctor)),
                  SliverToBoxAdapter(
                    child: SelectionStarRow(reviewCubit: reviewCubit),
                  ),
                  SliverToBoxAdapter(
                    child: BigTextReviewFormField(reviewCubit: reviewCubit),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
