import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/presentation/cubit/review_cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
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

  void submitReview() async {
    emit(ReviewLoading());
    try {
      await Future.delayed(Duration(seconds: 5));
      if (kDebugMode) {
        print('🌵🌵🌵🌵🌵🌵🌵🌵🌵');
        print('{Rating: $rating || Review: ${reviewController.text}}');
        print('🌵🌵🌵🌵🌵🌵🌵🌵🌵');
      }
      emit(ReviewSuccess());
    } catch (e) {
      emit(ReviewFailure());
    }
  }

  @override
  Future<void> close() {
    reviewController.dispose();
    return super.close();
  }
}
