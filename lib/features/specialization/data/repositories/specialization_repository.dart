import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/specialization/data/models/specialization_model.dart';

class SpecializationRepository {
  final ApiConsumer api;

  SpecializationRepository({required this.api});
  Future<Either<Failure, List<SpecializationModel>>>
  getSpecializations() async {
    try {
      final response = await api.get(path: 'doctors/specializations');
      List<SpecializationModel> specializations =
          (response['data']['data'] as List)
              .map((e) => SpecializationModel.fromJson(e))
              .toList();
      return right(specializations);
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }
}
