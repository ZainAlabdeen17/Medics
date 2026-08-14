import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/doctor/data/repository/doctor_repository.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  DoctorRepository doctorRepository = DoctorRepository(
    api: getIt<ApiConsumer>(),
  );
  ReviewCubit() : super(ReviewInitial());
  int rating = 0;
  TextEditingController reviewController = TextEditingController();

  void changeRating(int starIndex) {
    rating = starIndex;
    emit(ReviewInitial());
  }

  void updateReview() {
    emit(ReviewUpdated(rating: rating, review: reviewController.text));
  }

  void submitReview({required String doctorId}) async {
    emit(ReviewLoading());
    final result = await doctorRepository.storeDoctorReview(
      doctorId: doctorId,
      rating: rating,
      comment: reviewController.text,
    );
    result.fold(
      (failure) => emit(ReviewFailure(errorMessage: failure.message)),
      (success) => emit(ReviewSuccess()),
    );
  }

  Future<void> getReviews({required String doctorId}) async {
    emit(GetReviewLoading());
    final result = await doctorRepository.getDoctorReviews(doctorId: doctorId);
    result.fold(
      (failure) => emit(GetReviewFailure(errorMessage: failure.message)),
      (reviews) => emit(GetReviewSuccess(reviews: reviews)),
    );
  }

  @override
  Future<void> close() {
    reviewController.dispose();
    return super.close();
  }
}
