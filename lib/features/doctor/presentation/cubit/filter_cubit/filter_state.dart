const _empty = Object();

class FilterState {
  final List<String> selectedSpecializations;
  final Object? selectedExperience;
  final Object? selectedGender;
  final bool showAll;
  final bool hasFilter;

  FilterState({
    this.selectedSpecializations = const [],
    this.selectedExperience,
    this.selectedGender,
    this.showAll = false,
    this.hasFilter = false,
  });
  FilterState copyWith({
    List<String>? selectedSpecializations,
    Object? selectedExperience = _empty,
    Object? selectedGender = _empty,
    bool? showAll,
    bool? hasFilter,
  }) {
    return FilterState(
      selectedSpecializations:
          selectedSpecializations ?? this.selectedSpecializations,
      selectedExperience: selectedExperience == _empty
          ? this.selectedExperience
          : selectedExperience as String?,
      selectedGender: selectedGender == _empty
          ? this.selectedGender
          : selectedGender as String?,
      showAll: showAll ?? this.showAll,
      hasFilter: hasFilter ?? this.hasFilter,
    );
  }
}
