import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/medical_records/data/medication_model.dart';

class MedicalRecordsRepository {
  final ApiConsumer apiConsumer;

  MedicalRecordsRepository(this.apiConsumer);
  Future<Either<Failure, List<PrescriptionModel>>> getMedicalRecords() async {
    try {
      final response = await apiConsumer.get(path: 'patient/prescriptions');
      final List<PrescriptionModel> prescriptions = (response["data"]["prescriptions"] as List)
          .map((data) => PrescriptionModel.fromJson(data))
          .toList();
      return Right(prescriptions);
    }on ServerExeption catch (e) {
      return  Left(e.failure);
    }
  }
}
