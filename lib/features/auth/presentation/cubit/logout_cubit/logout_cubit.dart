import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/core/services/new_pusher_service.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/auth/data/repositories/auth_repository.dart';
import 'package:medics/features/auth/presentation/cubit/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository repository;
  LogoutCubit(this.repository) : super(LogoutInitial());
  void logout() async {
    if (!isClosed) {
      emit(LogoutLoading());
    }
    await repository.logout();
    if (!isClosed) {
      emit(LogoutSuccess());
      getIt<PusherServices>().disconnectAll();
    }
  }
}
