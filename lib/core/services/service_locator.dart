
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medics/core/api/dio_consumer.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  // 2. تسجيل الأداة الخارجية (Dio) - يفضل كـ Singleton
  getIt.registerLazySingleton<Dio>(() => Dio());

  // 3. تسجيل الـ Consumer الذي يعتمد على Dio
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));

  // 4. تسجيل الـ Repository الذي يعتمد على الـ Consumer
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(api: getIt<DioConsumer>()));

  // 5. تسجيل الـ Cubit (استخدم Factory لأن الـ Cubit يتم إغلاقه وإنشاؤه مجدداً عادةً)
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<AuthRepository>()));
}
