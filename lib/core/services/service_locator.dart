import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/api/dio_consumer.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/doctor/data/repository/doctor_repository.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/medical_records/data/repository/health_repository.dart';
import 'package:medics/features/medical_records/data/repository/health_repository_imp.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit.dart';
import 'package:medics/features/patient_card/data/repositories/patient_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // 1. تسجيل الأداة الخارجية (Dio)
  getIt.registerLazySingleton<Dio>(() => Dio());

  // 2. تسجيل الـ Consumer وتحديد نوعه كـ ApiConsumer (تم الدمج والحل هنا)
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  // 3. تسجيل الـ Repositories باستخدام الـ ApiConsumer الموحد
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<PatientRepository>(
    () => PatientRepository(api: getIt<ApiConsumer>()),
  );

  // 4. تسجيل الـ Cubits
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<AuthRepository>()));

  getIt.registerLazySingleton<DoctorRepository>(
    () => DoctorRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<DoctorCubit>(
    () => DoctorCubit(getIt<DoctorRepository>()),
  );


  getIt.registerLazySingleton<HealthRepository>(() => HealthRepositoryImpl(api: getIt<ApiConsumer>()));
  getIt.registerFactory<HealthCubit>(
    () => HealthCubit(healthRepository: getIt())..loadInitial(),
  );
}
