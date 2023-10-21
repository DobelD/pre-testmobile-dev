import 'package:get/get.dart';
import 'package:pretestmobiledev/infrastructure/navigation/routes.dart';

import '../../../utils/app_preference.dart';

enum HomeStatus { initial, loading, success, failed }

class HomeController extends GetxController {
  final userModel = AppPreference().getUserModel();
  var homeStatus = Rx<HomeStatus>(HomeStatus.initial);

  Future<void> logout() async {
    homeStatus.value = HomeStatus.loading;
    Future.delayed(3.seconds, () {
      AppPreference().clearUserModel();
      homeStatus.value = HomeStatus.success;
      Get.offAllNamed(Routes.LOGIN);
    });
  }
}
