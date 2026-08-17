import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/medical_records/data/repository/medical_records.dart';
import 'package:medics/features/medical_records/presentation/cubit/visits_cubit/visits_state.dart';

class VisitsCubit extends Cubit<VisitsState> {
  final MedicalRecordsRepository repository;

  VisitsCubit(this.repository) : super(VisitsInitial());

  Future<void> getVisits() async {
    if (!isClosed) {
      emit(VisitsLoading());
    }
    final result = await repository.getVisitsSummary();
    if (isClosed) return;
    result.fold(
      (failure) => emit(VisitsError(message: failure.message)),
      (visits) => emit(VisitsSuccess(visits)),
    );
  }
}
