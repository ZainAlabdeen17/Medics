// health_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/core/functions/user_functions.dart';
import 'package:medics/features/medical_records/data/models/health_metric_model.dart';
import 'package:medics/features/medical_records/data/repository/health_repository.dart';

class HealthRepositoryImpl implements HealthRepository {
  final ApiConsumer api;

  HealthRepositoryImpl({required this.api});

  @override
  Future<Either<Failure, HealthMetricModel>> getHealthData() async {
    return Right(HealthMetricModel.empty());
  }

  @override
  Future<Either<Failure, String>> saveHealthData({
    required HealthMetricModel model,
  }) async {
    try {
      //   final user = model.toJson();
      final user = UserFunctions.getUser();
      await api.put(
        path: "patient/updateprofile/${user?.id}",
        data: {
          "health_assessment": {
            "blood_type": "${model.body.bloodType}${model.body.rh}",
            "allergies": model.anamnesis.allergies,
            "chronic_condition": model.anamnesis.conditions,
            "height": model.body.height,
            "weight": model.body.weight,
          },
          "life_style": {
            "smoking": model.lifestyle.smoking,
            "alcohol": model.lifestyle.alcohol,
          },
        },
      );

      return const Right("Saved successfully");
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }
}
