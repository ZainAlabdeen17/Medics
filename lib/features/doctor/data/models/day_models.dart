class DayModel {
  final String fullDate;
  final String dayName;
  final String dayNumber;
  final String monthName;

  const DayModel({
    required this.fullDate,
    required this.dayName,
    required this.dayNumber,
    required this.monthName,
  });
  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      fullDate: json['full_date'],
      dayName: json['day_name'],
      dayNumber: json['day_number'],
      monthName: json['month_name'],
    );
  }
}
