import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String status;
  final bool isProfileCompleted;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.isProfileCompleted,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final user = data['user'];
    final atributes = user['attributes'];
    return UserModel(
      id: user['id'],
      firstName: atributes['first_name'],
      lastName: atributes['last_name'],
      email: atributes['email'],
      status: atributes['status'],
      isProfileCompleted: atributes["is_profile_completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": {
        "user": {
          "id": id,
          "attributes": {
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "status": status,
            "is_profile_completed": isProfileCompleted,
          },
        },
      },
    };
  }

  String toJsonString() => json.encode(toJson());
}
