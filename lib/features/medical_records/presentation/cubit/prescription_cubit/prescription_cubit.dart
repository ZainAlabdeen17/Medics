import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/medical_records/data/repository/medical_records.dart';
import 'package:medics/features/medical_records/presentation/cubit/prescription_cubit/prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final MedicalRecordsRepository repository;
  PrescriptionCubit(this.repository) : super(PrescriptionInitial());
  Future<void> getPrescriptions() async {
    emit(PrescriptionLoading());
    final result = await repository.getMedicalRecords();
    result.fold(
      (failure) => emit(PrescriptionError(message: failure.message)),
      (prescriptions) => emit(PrescriptionSuccess(prescriptions)),
    );
  }
}
