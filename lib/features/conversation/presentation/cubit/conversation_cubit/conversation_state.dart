import 'package:medics/features/conversation/data/models/doctor_thread_model.dart';

abstract class ConversationsState {}

class ConversationsInitial extends ConversationsState {}

class ConversationsLoading extends ConversationsState {}

class ConversationsLoaded extends ConversationsState {
  final List<DoctorThreadModel> conversations;
  ConversationsLoaded(this.conversations);
}

class ConversationsError extends ConversationsState {
  final String message;
  ConversationsError(this.message);
}
