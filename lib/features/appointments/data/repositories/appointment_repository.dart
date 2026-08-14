import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/appointments/data/models/appointment_model.dart';

class AppointmentRepository {
  final ApiConsumer api;

  AppointmentRepository({required this.api});
  Future<Either<Failure, List<AppointmentModel>>> getAppointments({
    required int page,
  }) async {
    try {
      final response = await api.get(
        path: 'patient/appointments',
        queryParameters: {'page': page},
      );
      final dataList = response['data'] as List<dynamic>? ?? [];
      final appointments = dataList.map((appointment) {
        return AppointmentModel.fromListJson(
          appointment as Map<String, dynamic>,
        );
      }).toList();
      return right(appointments);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> cancelAppointment({
    required String appointmentId,
    required String reason,
  }) async {
    try {
      final response = await api.patch(
        path: "appointments/$appointmentId/update",
        data: {"cancellation_reason": reason},
      );
      final message = response['message'] as String? ?? '';
      return right(message);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
