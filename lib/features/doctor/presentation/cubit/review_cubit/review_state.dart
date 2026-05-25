abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewUpdated extends ReviewState {
  final int rating;
  final String review;

  ReviewUpdated({required this.rating, required this.review});
}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {}

class ReviewFailure extends ReviewState {}
