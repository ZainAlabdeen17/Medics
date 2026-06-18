import 'package:dio/dio.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/services/service_locator.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = getIt<CacheHelper>().getData(key: 'token');
    options.headers['Authorization'] = token != null ? 'Bearer $token' : null;
    super.onRequest(options, handler);
  }
}
