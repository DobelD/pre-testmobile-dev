import 'package:get/get.dart';

import '../../../../presentation/login/controllers/login.controller.dart';
import '../../../dal/repositories/user_repository_impl.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(UserRepositoryImpl()),
    );
  }
}
