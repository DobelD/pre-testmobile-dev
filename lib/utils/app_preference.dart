import 'package:get_storage/get_storage.dart';

import '../domain/core/models/user_model.dart';

class AppPreference {
  final _storage = GetStorage();
  final String _userModelKey = 'user_model';

  static Future<void> initialize() async {
    await GetStorage.init();
  }

  Future<void> saveUserModel(UserModel userModel) async {
    await _storage.write(_userModelKey, userModel.toJson());
  }

  UserModel? getUserModel() {
    final userData = _storage.read(_userModelKey);
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }

  Future<void> clearUserModel() async {
    await _storage.remove(_userModelKey);
  }
}
