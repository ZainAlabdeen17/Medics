import 'package:dio/dio.dart';
import 'package:medics/core/error/failure.dart';

class ServerExeption implements Exception {
  final Failure failure;
  ServerExeption({required this.failure});
}

Exception handleDioException(DioException e) {
  final responseData = e.response?.data;

  if (responseData != null) {
    if (responseData is String) {
      return ServerExeption(failure: Failure(message: responseData));
    }
    return ServerExeption(failure: Failure.fromJson(responseData));
  }

  return ServerExeption(
    failure: Failure(message: e.message ?? 'Unexpected error'),
  );
}
