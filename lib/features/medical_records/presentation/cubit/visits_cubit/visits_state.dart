import 'package:medics/features/medical_records/data/models/visit_model.dart';

abstract class VisitsState {}

class VisitsInitial extends VisitsState {}

class VisitsLoading extends VisitsState {}

class VisitsSuccess extends VisitsState {
  final List<VisitModel> visits;
  VisitsSuccess(this.visits);
}

class VisitsError extends VisitsState {
  final String message;
  VisitsError({required this.message});
}
