import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/doctor/data/models/day_models.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

class DoctorRepository {
  final ApiConsumer api;

  DoctorRepository({required this.api});
  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    String? searchQuery,
    List<String>? specializations,
    String? experience,
    String? gender,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['search'] = searchQuery;
      }
      if (specializations != null && specializations.isNotEmpty) {
        queryParams['specialization'] = specializations.join(',');
      }
      if (experience != null) {
        queryParams['experience'] = experience;
      }
      if (gender != null) {
        queryParams['gender'] = gender;
      }
      final response = await api.get(
        path: "doctors",
        queryParameters: queryParams,
      );
      final List<DoctorModel> doctors = (response['data'] as List).map((
        doctor,
      ) {
        return DoctorModel.fromJson(doctor);
      }).toList();
      return Right(doctors);
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }
  Future<Either<Failure, List<DayModel>>> getBookingDays(
    String doctorId,
  ) async {
    final response = await api.get(path: 'doctors/$doctorId/available-days');

    try {
      final List<dynamic> data = response['data']['attributes']['days'];
      final List<DayModel> days = data
          .map((json) => DayModel.fromJson(json))
          .toList();
      return Right(days);
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }
}
