import 'package:medics/features/doctor/data/models/doctor_model.dart';

class AppointmentModel {
  final String id;
  final DoctorModel doctor;
  final String date;
  final String startTime;
  final String endTime;
  final String status;
  final String reason;
  final String invoiceId;
  final String invoiceNumber;
  final String currentBalance;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.reason,
    required this.invoiceId,
    required this.invoiceNumber,
    required this.currentBalance,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    try {
      final data = json['data'] as Map<String, dynamic>? ?? {};
      final appointment = data['appointment'] as Map<String, dynamic>? ?? {};
      final attributes =
          appointment['attributes'] as Map<String, dynamic>? ?? {};

      final relationships =
          appointment['relationships'] as Map<String, dynamic>? ?? {};
      final doctorData = relationships['doctor'] as Map<String, dynamic>? ?? {};

      return AppointmentModel(
        id: appointment['id']?.toString() ?? '',
        doctor: DoctorModel.fromJson(doctorData),
        date: attributes['appointment_date']?.toString() ?? '',
        startTime: attributes['start_time']?.toString() ?? '',
        endTime: attributes['end_time']?.toString() ?? '',
        status: attributes['status']?.toString() ?? '',
        reason: attributes['reason']?.toString() ?? '',
        invoiceId: data['invoice_id']?.toString() ?? '',
        invoiceNumber: data['invoice_number']?.toString() ?? '',
        currentBalance: data['current_balance']?.toString() ?? '0.00',
      );
    } catch (e) {
      return AppointmentModel(
        id: '',
        doctor: DoctorModel.fromJson({}),
        date: '',
        startTime: '',
        endTime: '',
        status: 'pending',
        reason: '',
        invoiceId: '',
        invoiceNumber: '',
        currentBalance: '0.00',
      );
    }
  }
  factory AppointmentModel.fromListJson(Map<String, dynamic> json) {
    try {
      final attributes = json['attributes'] as Map<String, dynamic>? ?? {};
      final financial = json['financial'] as Map<String, dynamic>? ?? {};
      final invoices = financial['invoices'] as List<dynamic>? ?? [];

      String invId = '';
      String invNumber = '';

      if (invoices.isNotEmpty) {
        final firstInvoice = invoices.first as Map<String, dynamic>? ?? {};
        invId = firstInvoice['id']?.toString() ?? '';
        invNumber = firstInvoice['invoice_number']?.toString() ?? '';
      }
      final relationships =
          json['relationships'] as Map<String, dynamic>? ?? {};
      final doctorData = relationships['doctor'] as Map<String, dynamic>? ?? {};

      return AppointmentModel(
        id: json['id']?.toString() ?? '',
        doctor: DoctorModel.fromJson(doctorData),
        date: attributes['appointment_date']?.toString() ?? '',
        startTime: attributes['start_time']?.toString() ?? '',
        endTime: attributes['end_time']?.toString() ?? '',
        status: attributes['status']?.toString() ?? '',
        reason: attributes['reason']?.toString() ?? '',
        invoiceId: invId,
        invoiceNumber: invNumber,
        currentBalance: '0.00',
      );
    } catch (e) {
      return AppointmentModel.createEmpty();
    }
  }
  factory AppointmentModel.createEmpty() {
    return AppointmentModel(
      id: '',
      doctor: DoctorModel.fromJson({}),
      date: '',
      startTime: '',
      endTime: '',
      status: 'pending',
      reason: '',
      invoiceId: '',
      invoiceNumber: '',
      currentBalance: '0.00',
    );
  }
}
