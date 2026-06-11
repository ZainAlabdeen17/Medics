// patient_state.dart

part of 'patient_card_cubit.dart';

class PatientCardState {
  // Personal Data
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String city;
  final String address;

  // Emergency Contact
  final String emergencyFirstName;
  final String emergencyLastName;
  final String relationship;
  final String emergencyPhone;
  final String emergencyEmail;
  final String emergencyCity;

  // Health Assessment
  final String bloodType;
  final String rhType;
  final String allergies;
  final String chronicConditions;
  final String height;
  final String weight;
  final String systolicPressure;
  final String diastolicPressure;

  // Lifestyle
  final String smoking;
  final String alcohol;
  final String activityLevel;

  const PatientCardState({
    // Personal Data
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth = '',
    this.phoneNumber = '',
    this.city = '',
    this.address = '',

    // Emergency Contact
    this.emergencyFirstName = '',
    this.emergencyLastName = '',
    this.relationship = '',
    this.emergencyPhone = '',
    this.emergencyEmail = '',
    this.emergencyCity = '',

    // Health Assessment
    this.bloodType = 'B(III)',
    this.rhType = '+',
    this.allergies = '',
    this.chronicConditions = '',
    this.height = '',
    this.weight = '',
    this.systolicPressure = '',
    this.diastolicPressure = '',

    // Lifestyle
    this.smoking = '',
    this.alcohol = '',
    this.activityLevel = '',
  });

  PatientCardState copyWith({
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? phoneNumber,
    String? city,
    String? address,
    String? emergencyFirstName,
    String? emergencyLastName,
    String? relationship,
    String? emergencyPhone,
    String? emergencyEmail,
    String? emergencyCity,
    String? bloodType,
    String? rhType,
    String? allergies,
    String? chronicConditions,
    String? height,
    String? weight,
    String? systolicPressure,
    String? diastolicPressure,
    String? smoking,
    String? alcohol,
    String? activityLevel,
  }) {
    return PatientCardState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      address: address ?? this.address,
      emergencyFirstName: emergencyFirstName ?? this.emergencyFirstName,
      emergencyLastName: emergencyLastName ?? this.emergencyLastName,
      relationship: relationship ?? this.relationship,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      emergencyEmail: emergencyEmail ?? this.emergencyEmail,
      emergencyCity: emergencyCity ?? this.emergencyCity,
      bloodType: bloodType ?? this.bloodType,
      rhType: rhType ?? this.rhType,
      allergies: allergies ?? this.allergies,
      chronicConditions: chronicConditions ?? this.chronicConditions,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      systolicPressure: systolicPressure ?? this.systolicPressure,
      diastolicPressure: diastolicPressure ?? this.diastolicPressure,
      smoking: smoking ?? this.smoking,
      alcohol: alcohol ?? this.alcohol,
      activityLevel: activityLevel ?? this.activityLevel,
    );
  }
}