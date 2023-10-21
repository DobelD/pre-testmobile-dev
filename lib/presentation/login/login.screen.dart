import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    enabledBorder: _border,
                    border: _border,
                    focusedBorder: _focusedBorder,
                    prefixIcon: const Icon(Icons.person)),
                validator: (String? value) =>
                    controller.validateUsername(value ?? ''),
                autovalidateMode: AutovalidateMode.onUserInteraction),
            const SizedBox(height: 12),
            Obx(() {
              return TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isObscureText.value,
                  decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: _border,
                      border: _border,
                      focusedBorder: _focusedBorder,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () => controller.suffixPasswordOnTap(),
                        icon: Icon(controller.isObscureText.isTrue
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  validator: (String? value) =>
                      controller.validatePassword(value ?? ''),
                  autovalidateMode: AutovalidateMode.onUserInteraction);
            }),
            const SizedBox(height: 22),
            SizedBox(
              width: Get.width,
              height: 46,
              child: Obx(() {
                final loginStatus = controller.loginStatus.value;
                if (loginStatus == LoginStatus.loading) {
                  return ElevatedButton(
                    onPressed: () {},
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text('Login'),
                  );
                }
              }),
            )
          ],
        ),
      ),
    ));
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300));
  }

  OutlineInputBorder get _focusedBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue));
  }
}
