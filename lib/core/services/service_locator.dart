import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/api/dio_consumer.dart';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/services/new_pusher_service.dart';
import 'package:medics/features/ai_chat/data/repositories/ai_chat_repository.dart';
import 'package:medics/features/ai_chat/presentation/cubit/ai_chat_cubit/ai_chat_cubit.dart';
import 'package:medics/features/appointments/data/repositories/appointment_repository.dart';
import 'package:medics/features/appointments/presentation/cubit/appointment_cubit/appointment_cubit.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:medics/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:medics/features/chat/data/data_source/chat_remote_data_source.dart';
import 'package:medics/features/chat/data/data_source/chat_remote_data_source_impl.dart';
import 'package:medics/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:medics/features/chat/domain/repositories/chat_repository.dart';
import 'package:medics/features/chat/domain/usecases/get_messages_use_case.dart';
import 'package:medics/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:medics/features/chat/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:medics/features/conversation/data/repositories/conversation_repository.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_cubit.dart';
import 'package:medics/features/doctor/data/repository/booking_repositry.dart';
import 'package:medics/features/doctor/data/repository/doctor_repository.dart';
import 'package:medics/features/doctor/presentation/cubit/book_cubit/book_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_cubit.dart';
import 'package:medics/features/medical_records/data/repository/health_repository.dart';
import 'package:medics/features/medical_records/data/repository/health_repository_imp.dart';
import 'package:medics/features/medical_records/data/repository/medical_records.dart';
import 'package:medics/features/medical_records/presentation/cubit/health_cubit/health_cubit.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_details_cubit/doctor_details_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/medical_tests_cubit/medical_tests_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/prescription_cubit/prescription_cubit.dart';
import 'package:medics/features/medical_records/presentation/cubit/visits_cubit/visits_cubit.dart';
import 'package:medics/features/patient_card/data/repositories/patient_repository.dart';
import 'package:medics/features/payments/data/repositories/payments_repository.dart';
import 'package:medics/features/payments/presentation/cubit/charge_wallet/charge_wallet_cubit.dart';
import 'package:medics/features/payments/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'package:medics/features/specialization/data/repositories/specialization_repository.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_cubit.dart';

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
  getIt.registerLazySingleton<BookingRepositry>(
    () => BookingRepositry(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<DoctorCubit>(
    () => DoctorCubit(getIt<DoctorRepository>()),
  );

  getIt.registerLazySingleton<HealthRepository>(
    () => HealthRepositoryImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<HealthCubit>(
    () => HealthCubit(healthRepository: getIt())..loadInitial(),
  );
  getIt.registerFactory<DoctorDetailsCubit>(
    () => DoctorDetailsCubit(getIt<BookingRepositry>()),
  );
  getIt.registerFactory<BookCubit>(() => BookCubit(getIt<BookingRepositry>()));
  getIt.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(getIt<AppointmentRepository>()),
  );
  getIt.registerLazySingleton<MedicalRecordsRepository>(
    () => MedicalRecordsRepository(getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<SpecializationRepository>(
    () => SpecializationRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<PrescriptionCubit>(
    () => PrescriptionCubit(getIt<MedicalRecordsRepository>()),
  );
  getIt.registerFactory<SpecializationCubit>(
    () => SpecializationCubit(getIt<SpecializationRepository>()),
  );
  getIt.registerLazySingleton<AiChatRepository>(
    () => AiChatRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<PaymentsRepository>(
    () => PaymentsRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<ConversationRepository>(
    () => ConversationRepository(api: getIt<ApiConsumer>()),
  );
  getIt.registerFactory<AiChatCubit>(
    () => AiChatCubit(getIt<AiChatRepository>()),
  );
  getIt.registerFactory<MedicalTestsCubit>(
    () => MedicalTestsCubit(getIt<MedicalRecordsRepository>()),
  );
  getIt.registerFactory<VisitsCubit>(
    () => VisitsCubit(getIt<MedicalRecordsRepository>()),
  );
  getIt.registerFactory<WalletBalanceCubit>(
    () => WalletBalanceCubit(getIt<PaymentsRepository>()),
  );
  getIt.registerFactory<ChargeWalletCubit>(
    () => ChargeWalletCubit(getIt<PaymentsRepository>()),
  );
  getIt.registerFactory<ConversationsCubit>(
    () => ConversationsCubit(getIt<ConversationRepository>()),
  );
  getIt.registerFactory<LogoutCubit>(
    () => LogoutCubit(getIt<AuthRepository>()),
  );
  //
  getIt.registerLazySingleton<PusherServices>(() => PusherServices());
  //
  getIt.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(api: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(remoteDataSource: getIt<ChatRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetMessagesUseCase>(
    () => GetMessagesUseCase(repository: getIt<ChatRepository>()),
  );

  getIt.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(repository: getIt<ChatRepository>()),
  );
  //
  getIt.registerFactory<ChatCubit>(
    () => ChatCubit(getIt<GetMessagesUseCase>(), getIt<SendMessageUseCase>()),
  );
}
