class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String status;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final user = data['user'];
    final atributes = user['atributes'];
    return UserModel(
      id: user['id'],
      firstName: atributes['first_name'],
      lastName: atributes['last_name'],
      email: atributes['email'],
      status: atributes['status'],
    );
  }
}