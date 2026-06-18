import 'dart:convert';

import 'package:medics/features/auth/data/models/user_model.dart';

class AuthSessionModel {
  final UserModel user;
  final String token;

  AuthSessionModel({required this.user, required this.token});
  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      user: UserModel.fromJson(json),
      token: json['data']['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": {
        "user": {
          "id": user.id,
          "attributes": {
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "status": user.status,
            "is_profile_completed": user.isProfileCompleted,
          },
        },
        "token": token,
      },
    };
  }

  String toJsonString() => json.encode(toJson());
  
}
