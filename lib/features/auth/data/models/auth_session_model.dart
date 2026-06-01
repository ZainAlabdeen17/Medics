import 'package:medics/features/auth/data/models/user_model.dart';

class AuthSessionModel {
  final UserModel user;
  final String token;
AuthSessionModel({
    required this.user,
    required this.token,
  });
  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      user: UserModel.fromJson(json),
      token: json['data']['token'],
    );
    
  }
}