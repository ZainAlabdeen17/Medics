class PatientCardModel {

  // شاشة 1: Personal Data
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? phoneNumber;
  final String? email;
  final String? city;
  final String? address;

  // شاشة 2: Emergency Contact
  final String? emergencyFirstName;
  final String? emergencyLastName;
  final String? relationship;
  final String? emergencyPhone;

  // شاشة 3: Health Assessment
  final String? bloodType; // e.g., A, B, O, AB
  final String? rhFactor;  // e.g., +, -
  final String? allergies;
  final String? chronicConditions;
  final double? height;
  final double? weight;
  final String? bloodPressure;

  // شاشة 4: Lifestyle Information
  // final SmokingStatus smokingStatus;
  // final AlcoholStatus alcoholStatus;
  // final ActivityLevel activityLevel;

  PatientCardModel({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.email,
    this.city,
    this.address,
    this.emergencyFirstName,
    this.emergencyLastName,
    this.relationship,
    this.emergencyPhone,
    this.bloodType,
    this.rhFactor,
    this.allergies,
    this.chronicConditions,
    this.height,
    this.weight,
    this.bloodPressure,
    // this.smokingStatus = SmokingStatus.none,
    // this.alcoholStatus = AlcoholStatus.none,
    // this.activityLevel = ActivityLevel.none,
  });

  // دالة copyWith لتحديث الحقول تدريجياً عبر الشاشات
  PatientCardModel copyWith({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? email,
    String? city,
    String? address,
    String? emergencyFirstName,
    String? emergencyLastName,
    String? relationship,
    String? emergencyPhone,
    String? bloodType,
    String? rhFactor,
    String? allergies,
    String? chronicConditions,
    double? height,
    double? weight,
    String? bloodPressure,
    // SmokingStatus? smokingStatus,
    // AlcoholStatus? alcoholStatus,
    // ActivityLevel? activityLevel,
  }) {
    return PatientCardModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      city: city ?? this.city,
      address: address ?? this.address,
      emergencyFirstName: emergencyFirstName ?? this.emergencyFirstName,
      emergencyLastName: emergencyLastName ?? this.emergencyLastName,
      relationship: relationship ?? this.relationship,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      bloodType: bloodType ?? this.bloodType,
      rhFactor: rhFactor ?? this.rhFactor,
      allergies: allergies ?? this.allergies,
      chronicConditions: chronicConditions ?? this.chronicConditions,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      // smokingStatus: smokingStatus ?? this.smokingStatus,
      // alcoholStatus: alcoholStatus ?? this.alcoholStatus,
      // activityLevel: activityLevel ?? this.activityLevel,
    );
  }

  // دالة لتحويل البيانات إلى JSON لإرسالها للـ API
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'dob': dateOfBirth?.toIso8601String(),
      'phone': phoneNumber,
      'email': email,
      'city': city,
      'address': address,
      'emergency_contact': {
        'name': '$emergencyFirstName $emergencyLastName',
        'relation': relationship,
        'phone': emergencyPhone,
      },
      'medical_info': {
        'blood_type': '$bloodType$rhFactor',
        'height': height,
        'weight': weight,
        'bp': bloodPressure,
      },
      'lifestyle': {
        // 'smoking': smokingStatus.name,
        // 'alcohol': alcoholStatus.name,
        // 'activity': activityLevel.name,
      }
    };
  }
}
