import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/medical_records/data/repository/medical_records.dart';
import 'package:medics/features/medical_records/presentation/cubit/medical_tests_cubit/medical_tests_state.dart';

class MedicalTestsCubit extends Cubit<MedicalTestsState> {
  final MedicalRecordsRepository repository;
  MedicalTestsCubit(this.repository) : super(MedicalTestsInitial());
  Future<void> getMedicalTests() async {
    emit(MedicalTestsLoading());
    final result = await repository.getMedicalTests();
    result.fold(
      (failure) => emit(MedicalTestsError(message: failure.message)),
      (medicalTests) => emit(MedicalTestsSuccess(medicalTests)),
    );
  }

  Future<void> getXRays() async {
    emit(MedicalTestsLoading());
    final result = await repository.getXRays();
    result.fold(
      (failure) => emit(MedicalTestsError(message: failure.message)),
      (xrays) => emit(MedicalTestsSuccess(xrays)),
    );
  }
}
