import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/auth/data/models/auth_session_model.dart';

class AuthRepository {
  final ApiConsumer api;

  AuthRepository({required this.api});

  Future<Either<Failure, AuthSessionModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        path: "login",
        data: {"email": email, "password": password},
      );
      final authSessionModel = AuthSessionModel.fromJson(response);
      getIt<CacheHelper>().saveData(key: 'token', value: authSessionModel.token);
      return Right(authSessionModel);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }
}
