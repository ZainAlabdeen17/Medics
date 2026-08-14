import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/features/doctor/data/models/doctor_model.dart';
import 'package:medics/features/doctor/data/models/review_model.dart';

class DoctorRepository {
  final ApiConsumer api;

  DoctorRepository({required this.api});
  Future<Either<Failure, List<DoctorModel>>> getDoctors({
    String? searchQuery,
    List<String>? specializations,
    String? experience,
    String? gender,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (searchQuery != null && searchQuery.isNotEmpty) {
        queryParams['search'] = searchQuery;
      }
      if (specializations != null && specializations.isNotEmpty) {
        queryParams['specialization'] = specializations.join(',');
      }
      if (experience != null) {
        queryParams['experience'] = experience;
      }
      if (gender != null) {
        queryParams['gender'] = gender;
      }
      final response = await api.get(
        path: "doctors",
        queryParameters: queryParams,
      );
      final List<DoctorModel> doctors = (response['data'] as List).map((
        doctor,
      ) {
        return DoctorModel.fromJson(doctor);
      }).toList();
      return Right(doctors);
    } on ServerExeption catch (e) {
      return Left(e.failure);
    }
  }

  Future<Either<Failure, List<ReviewModel>>> getDoctorReviews({
    required String doctorId,
  }) async {
    try {
      final response = await api.get(path: 'doctors/$doctorId/reviews');
      final List<ReviewModel> reviews = (response['data']['reviews'] as List)
          .map((review) {
            return ReviewModel.fromJson(review);
          })
          .toList();
      return right(reviews);
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> storeDoctorReview({
    required String doctorId,
    required int rating,
    required String comment,
  }) async {
    try {
      await api.post(
        path: 'doctors/$doctorId/reviews',
        data: {"rating": rating, "comment": comment},
      );
      return right('Review submitted successfully');
    } on ServerExeption catch (e) {
      return left(e.failure);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
