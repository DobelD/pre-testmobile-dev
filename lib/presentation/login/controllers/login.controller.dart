import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretestmobiledev/domain/core/models/user.dart';
import 'package:pretestmobiledev/infrastructure/navigation/routes.dart';

import '../../../domain/core/interfaces/user_repository.dart';

enum LoginStatus { initial, loading, success, failed }

class LoginController extends GetxController {
  final UserRepository _userRepository;
  LoginController(this._userRepository);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loginStatus = Rx<LoginStatus>(LoginStatus.initial);
  final formKey = GlobalKey<FormState>();
  var isObscureText = true.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      loginStatus.value = LoginStatus.loading;
      var loginParam = LoginParam(
          username: usernameController.text.trim(),
          password: passwordController.text.trim());
      final user = await _userRepository.login(loginParam);
      if (user != null) {
        loginStatus.value = LoginStatus.success;
        Get.offAllNamed(Routes.HOME);
      } else {
        loginStatus.value = LoginStatus.failed;
      }
    }
  }

  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      return '''
Password must contain at least one uppercase letter,
one lowercase letter, and one digit
''';
    } else {
      return null;
    }
  }

  void suffixPasswordOnTap() {
    isObscureText.value = !isObscureText.value;
  }
}
