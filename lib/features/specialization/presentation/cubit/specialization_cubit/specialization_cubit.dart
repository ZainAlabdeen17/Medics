import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/specialization/data/repositories/specialization_repository.dart';
import 'package:medics/features/specialization/presentation/cubit/specialization_cubit/specialization_state.dart';

class SpecializationCubit extends Cubit<SpecializationState> {
  final SpecializationRepository repo;
  SpecializationCubit(this.repo) : super(SpecializationInitial());
  Future<void> getSpecializations() async {
    emit(SpecializationLoading());
    final result = await repo.getSpecializations();
    if (isClosed) return;
    result.fold(
      (failure) => emit(SpecializationFailure(errorMessage: failure.message)),
      (specializations) =>
          emit(SpecializationSuccess(specializations: specializations)),
    );
  }
}
