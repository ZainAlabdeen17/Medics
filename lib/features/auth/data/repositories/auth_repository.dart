import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/auth/data/models/auth_session_model.dart';
import 'package:medics/features/auth/data/models/user_model.dart';

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
      getIt<CacheHelper>().saveData(
        key: 'token',
        value: authSessionModel.token,
      );
      debugPrint("Token saved: ${authSessionModel.token}");
      
      return Right(authSessionModel);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }

  Future<Either<Failure, UserModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        path: "register",
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "password_confirmation": password,
        },
      );
      final userModel = UserModel.fromJson(response);
      return Right(userModel);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }

  Future<Either<Failure, AuthSessionModel>> verifyEmail({
    required String email,
    required String code,
  }) async {
    try {
      final response = await api.post(
        path: "verify-otp",
        data: {"email": email, "code": code},
      );
      final authSessionModel = AuthSessionModel.fromJson(response);
      getIt<CacheHelper>().saveData(
        key: "token",
        value: authSessionModel.token,
      );
      return Right(authSessionModel);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }
}
