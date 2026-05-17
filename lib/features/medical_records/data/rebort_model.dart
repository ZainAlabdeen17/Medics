enum ResultStatus { normal, attention, followUp }

class LabResult {
  final String testName;
  final DateTime testDate;
  final ResultStatus status;
  final DateTime? resultsAvailableDate;
  final bool isResultReady;

  LabResult({
    required this.testName,
    required this.testDate,
    required this.status,
    this.resultsAvailableDate,
    this.isResultReady = true,
  });

  static List<LabResult> getReportResult() {
    return [
      LabResult(
        testName: 'Complete Blood Count (CBC)',
        testDate: DateTime(2024, 1, 2),
        status: ResultStatus.normal,
        resultsAvailableDate: DateTime(2024, 1, 3),
      ),
      LabResult(
        testName: 'Lipid Panel',
        testDate: DateTime(2024, 1, 2),
        status: ResultStatus.attention,
      ),
      LabResult(
        testName: 'Thyroid Function Test',
        testDate: DateTime(2024, 1, 2),
        status: ResultStatus.followUp,
      ),
    ];
  }

  String get statusText {
    switch (status) {
      case ResultStatus.normal:
        return 'Normal Results';
      case ResultStatus.attention:
        return 'Requires Attention';
      case ResultStatus.followUp:
        return 'Follow-Up Needed';
    }
  }

  String get formattedDate =>
      '${testDate.day} ${_monthAbbr(testDate.month)}, ${testDate.year}';

  String _monthAbbr(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
