import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/doctor/presentation/cubit/filter_cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  bool isFilterApplayed = false;
  void toggleSpecialization(String id) {
    final selected = List<String>.from(state.selectedSpecializations);
    if (selected.contains(id)) {
      selected.remove(id);
    } else {
      selected.add(id);
    }
    emit(state.copyWith(selectedSpecializations: selected));
  }

  void toggleShowAll() {
    emit(state.copyWith(showAll: !state.showAll));
  }

  void selectExperience(String experience) {
    emit(state.copyWith(selectedExperience: experience));
  }

  void selectGender(String gender) {
    emit(state.copyWith(selectedGender: gender));
  }

  void resetFilters() {
    emit(
      state.copyWith(
        selectedSpecializations: [],
        showAll: false,
        selectedExperience: null,
        selectedGender: null,
      ),
    );
  }

  void hasFilter() {
    if ((state.selectedSpecializations.isNotEmpty ||
            state.selectedExperience != null ||
            state.selectedGender != null) &&
        isFilterApplayed) {
      emit(state.copyWith(hasFilter: true));
    } else {
      emit(state.copyWith(hasFilter: false));
    }
  }
}
