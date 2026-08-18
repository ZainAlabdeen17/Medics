import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/conversation/data/models/doctor_thread_model.dart';

class ConversationRepository {
  final ApiConsumer api;

  ConversationRepository({required this.api});
  Future<Either<Failure, List<DoctorThreadModel>>> getDoctorThreads() async {
    try {
      final response = await api.get(path: "patient/chat/doctors-threads");
      final List rawList = response['message'];
      final List<DoctorThreadModel> threads = rawList
          .map((json) => DoctorThreadModel.fromJson(json))
          .where((thread) => thread.lastMessageTime != null)
          .toList();
      return right(threads);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
