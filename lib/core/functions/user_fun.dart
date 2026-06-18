import 'dart:convert';
import 'package:medics/core/database/cache/cache_helper.dart';
import 'package:medics/core/services/service_locator.dart';
import 'package:medics/features/auth/data/models/user_model.dart';

class UserFunctions {
  static void saveUser(UserModel user) async {
    String jsonString = user.toJsonString();
    await getIt<CacheHelper>().saveData(key: "user", value: jsonString);
  }

  static UserModel? getUser() {
    final String? userJson = getIt<CacheHelper>().getData(key: 'user');
    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson) as Map<String, dynamic>);
    }
    return null;
  }
}
