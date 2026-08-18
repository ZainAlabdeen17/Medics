import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/features/conversation/data/repositories/conversation_repository.dart';
import 'package:medics/features/conversation/presentation/cubit/conversation_cubit/conversation_state.dart';

class ConversationsCubit extends Cubit<ConversationsState> {
  final ConversationRepository repository;
  ConversationsCubit(this.repository) : super(ConversationsInitial());
  Future<void> fetchConversations() async {
    if (state is! ConversationsLoaded) {
      emit(ConversationsLoading());
    }
    final result = await repository.getDoctorThreads();
    result.fold(
      (failure) {
        if (!isClosed) emit(ConversationsError(failure.message));
      },
      (conversations) {
        if (!isClosed) emit(ConversationsLoaded(conversations));
      },
    );
  }
  //after merging my-learning-zone branch on main branch you should to make this cubit related with this below code

  // void startListeningToSocketUpdates() {
  //   _socketSubscription?.cancel();

  //   _socketSubscription = getIt<PusherService>().globalStream.listen((_) {
  //     fetchConversations();
  //   });
  // }

  // @override
  // Future<void> close() {
  //   _socketSubscription?.cancel();
  //   return super.close();
  // }
}
