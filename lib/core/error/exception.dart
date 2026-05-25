import 'package:dio/dio.dart';
import 'package:medics/core/error/error_model.dart';

class ServerExeption implements Exception {
  final ErrorModel errorModel;
  ServerExeption({required this.errorModel});
}

Exception handleDioException(DioException e) {
  final responseData = e.response?.data;

  if (responseData != null) {
    return ServerExeption(errorModel: ErrorModel.fromJson(responseData));
  }

  return ServerExeption(
    errorModel: ErrorModel(message: e.message ?? 'Unexpected error'),
  );
}
