class BookDayModel {
  final String month;
  final int day;
  final String weekDay;

  const BookDayModel({this.month = '', this.day = 00, this.weekDay = ''});
  static List<BookDayModel> getDays() {
    return [
      BookDayModel(month: 'Aug', day: 20, weekDay: 'Mon'),
      BookDayModel(month: 'Aug', day: 21, weekDay: 'Tue'),
      BookDayModel(month: 'Aug', day: 22, weekDay: 'Wed'),
      BookDayModel(month: 'Aug', day: 23, weekDay: 'Thu'),
      BookDayModel(month: 'Aug', day: 24, weekDay: 'Fri'),
      BookDayModel(month: 'Aug', day: 25, weekDay: 'Sat'),
      BookDayModel(month: 'Aug', day: 26, weekDay: 'Sun'),
    ];
  }
}
