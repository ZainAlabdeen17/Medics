import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';

class BookingRepositry {
  final ApiConsumer api;

  BookingRepositry({required this.api});
  Future<Either<Failure, List<DayModel>>> getBookingDays(
    String doctorId,
  ) async {
    final response = await api.get(path: 'doctors/$doctorId/available-days');

    try {
      final List<dynamic> data = response['data']['attributes']['days'];
      final List<DayModel> days = data
          .map((json) => DayModel.fromJson(json))
          .toList();
      return right(days);
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }

  Future<Either<Failure, List<String>>> getBookingTimes(
    String doctorId,
    String day,
  ) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (doctorId.isNotEmpty && day.isNotEmpty) {
        queryParameters = {'doctor_id': doctorId, 'date': day};
      }
      final response = await api.get(
        path: "appointments/available-slots",
        queryParameters: queryParameters,
      );
      final List<dynamic>? slotsData =
          response['data']?['attributes']?['slots'];

      final List<String> times = slotsData != null
          ? List<String>.from(slotsData.map((e) => e.toString()))
          : [];
      return right(times);
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }

  Future<Either<Failure, AppointmentModel>> bookAppointment({
    required String doctorId,
    required String date,
    required String time,
    required String reason,
  }) async {
    try {
      final response = await api.post(
        path: 'appointments/storeAppointment',
        data: {
          'doctor_id': doctorId,
          'date': date,
          'time': time,
          'reason': reason,
        },
      );
      final appointment = AppointmentModel.fromJson(response);
      return right(appointment);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
