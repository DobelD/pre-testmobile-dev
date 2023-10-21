import 'package:get/get.dart';
import 'package:pretestmobiledev/infrastructure/navigation/routes.dart';
import '../../../utils/app_preference.dart';

class SplashScreenController extends GetxController {
  Future<void> startSplashScreen() async {
    final userModel = AppPreference().getUserModel();
    Future.delayed(3.seconds, () {
      Get.offAllNamed(userModel != null ? Routes.HOME : Routes.LOGIN);
    });
  }
}
