import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';

class DoctorRepository {
  final ApiConsumer api;

  DoctorRepository({required this.api});
  Future<Either<Failure, List<DoctorModel>>> getDoctors() async {
    try {
      final response = await api.get(path: "doctors");
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
}
