import 'package:medics/features/doctor/data/models/review_model.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewUpdated extends ReviewState {
  final int rating;
  final String review;

  ReviewUpdated({required this.rating, required this.review});
}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {}

class ReviewFailure extends ReviewState {
  final String errorMessage;

  ReviewFailure({required this.errorMessage});
}

class GetReviewLoading extends ReviewState {}

class GetReviewSuccess extends ReviewState {
  final List<ReviewModel> reviews;
  GetReviewSuccess({required this.reviews});
}

class GetReviewFailure extends ReviewState {
  final String errorMessage;
  GetReviewFailure({required this.errorMessage});
}
