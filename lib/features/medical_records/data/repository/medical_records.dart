import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/medical_records/data/models/medical_test_model.dart';
import 'package:medics/features/medical_records/data/models/medication_model.dart';
import 'package:medics/features/medical_records/data/models/visit_model.dart';

class MedicalRecordsRepository {
  final ApiConsumer apiConsumer;

  MedicalRecordsRepository(this.apiConsumer);
  Future<Either<Failure, List<PrescriptionModel>>> getMedicalRecords() async {
    try {
      final response = await apiConsumer.get(path: 'patient/prescriptions');
      final List<PrescriptionModel> prescriptions =
          (response["data"]["prescriptions"] as List)
              .map((data) => PrescriptionModel.fromJson(data))
              .toList();
      return Right(prescriptions);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }

  Future<Either<Failure, List<MedicalTestModel>>> getMedicalTests() async {
    try {
      final response = await apiConsumer.get(
        path: 'patient/media/medical-tests',
      );
      final List<MedicalTestModel> medicalTests = (response["message"] as List)
          .map((data) => MedicalTestModel.fromJson(data))
          .toList();
      return Right(medicalTests);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<MedicalTestModel>>> getXRays() async {
    try {
      final response = await apiConsumer.get(path: 'patient/media/xrays');
      final List<MedicalTestModel> xrays = (response["message"] as List)
          .map((data) => MedicalTestModel.fromJson(data))
          .toList();
      return Right(xrays);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<VisitModel>>> getVisitsSummary() async {
    try {
      final response = await apiConsumer.get(path: 'patient/visit-summary');
      final List<VisitModel> visits = (response["data"]["visits"] as List)
          .map((data) => VisitModel.fromJson(data))
          .toList();
      return Right(visits);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
