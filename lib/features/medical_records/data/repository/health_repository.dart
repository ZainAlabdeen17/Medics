// health_repository.dart
import 'package:dartz/dartz.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/medical_records/data/health_metric_model.dart';

abstract class HealthRepository {
  Future<Either<Failure, HealthMetricModel>> getHealthData();
  Future<Either<Failure, String>> saveHealthData({required HealthMetricModel model});
}