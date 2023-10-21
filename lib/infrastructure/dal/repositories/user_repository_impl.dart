import 'package:pretestmobiledev/domain/core/models/user_model.dart';
import '../../../domain/core/interfaces/user_repository.dart';
import '../../../utils/app_preference.dart';
import '../daos/provider/remote/remote_provider.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl() {
    RemoteProvider.init();
  }
  @override
  Future<UserModel?> login(String username, String password) async {
    try {
      final Map<String, dynamic> data = {
        'username': username,
        'password': password,
      };

      final response = await RemoteProvider.client.post('login', data: data);

      if (response.statusCode == 200) {
        final userData = response.data['user'] as Map<String, dynamic>;
        var user = UserModel.fromJson(userData);
        AppPreference().saveUserModel(user);
        return user;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
