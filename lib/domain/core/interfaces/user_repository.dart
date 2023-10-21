import 'package:pretestmobiledev/domain/core/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> login(String username, String password);
}
