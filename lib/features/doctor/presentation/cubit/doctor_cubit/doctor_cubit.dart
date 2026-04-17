import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/presentation/cubit/doctor_cubit/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
}
