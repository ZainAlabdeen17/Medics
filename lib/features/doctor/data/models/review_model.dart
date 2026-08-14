class ReviewModel {
  final int id;
  final double rating;
  final String comment;
  final String patient;
  final DateTime date;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.patient,
    required this.date,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      patient: json['patient']['name'],
      date: DateTime.parse(json['created_at']),
    );
  }
}
