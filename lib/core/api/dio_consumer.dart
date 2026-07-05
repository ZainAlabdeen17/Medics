import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/api/api_interceptor.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';

class DioConsumer extends ApiConsumer {
  late Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl =
        "https://renewably-gladly-blitz.ngrok-free.dev/api/v1/";
    dio.options.receiveTimeout = const Duration(seconds: 50);
    dio.options.connectTimeout = const Duration(seconds: 50);
    dio.options.sendTimeout = const Duration(seconds: 50);
    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }
  @override
  Future delete({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw ServerExeption(failure: Failure(message: e.toString()));
    }
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw ServerExeption(failure: Failure(message: e.toString()));
    }
  }

  @override
  Future patch({
    required String path,
    Map<String, dynamic>? queryParameters,
    data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw ServerExeption(failure: Failure(message: e.toString()));
    }
  }

  @override
  Future post({
    required String path,
    Map<String, dynamic>? queryParameters,
    data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        queryParameters: queryParameters,
        data: isFormData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw ServerExeption(failure: Failure(message: e.toString()));
    }
  }
}
