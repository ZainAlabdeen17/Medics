class Failure {
  final String message;

  Failure({required this.message});
  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(message: json['message']);
  }
}
