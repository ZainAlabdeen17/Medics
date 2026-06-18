import 'package:dartz/dartz.dart';
import 'package:medics/core/api/api_consumer.dart';
import 'package:medics/core/error/exception.dart';
import 'package:medics/core/error/failure.dart';
import 'package:medics/core/functions/user_functions.dart';
import 'package:medics/features/auth/data/models/user_model.dart';
import 'package:medics/features/patient_card/presentation/cubit/patient_card_cubit.dart';

class PatientRepository {
  final ApiConsumer api;

  PatientRepository({required this.api});
  Future<Either<Failure, String>> submitPatientCard({
    required PatientCardState patientCardState,
  }) async {
    try {
      final user = UserFunctions.getUser();
      final responce = await api.post(
        path: "patient/CompleteProftile",
        data: {
          "personal_data": {
            "first_name": user!.firstName,
            "last_name": user.lastName,
            "date_of_birth": patientCardState.dateOfBirth,
            "phone_number": patientCardState.phoneNumber,
            "city": patientCardState.city,
          },
          "emergency_contact": {
            "first_name": patientCardState.emergencyFirstName,
            "last_name": patientCardState.emergencyLastName,
            "relationship": patientCardState.relationship,
            "phone_number": patientCardState.emergencyPhone,
            "email": patientCardState.emergencyEmail,
            "city": patientCardState.emergencyCity,
          },
          "health_assessment": {
            "blood_type": patientCardState.bloodType + patientCardState.rhType,
            "allergies": patientCardState.allergies,
            "chronic_condition": patientCardState.chronicConditions,
            "height": patientCardState.height,
            "weight": patientCardState.weight,
          },
          "life_style": {
            "smoking": patientCardState.smoking,
            "alcohol": patientCardState.alcohol,
          },
        },
      );
      final userModel = UserModel.fromJson(responce);
      UserFunctions.saveUser(userModel);

      return const Right("submit is successful");
    } on ServerExeption catch (e) {
      return left(e.failure);
    }
  }
}
