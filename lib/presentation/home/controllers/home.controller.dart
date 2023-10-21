import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:pretestmobiledev/infrastructure/navigation/routes.dart';

import '../../../utils/app_preference.dart';

enum HomeStatus { initial, loading, success, failed }

class HomeController extends GetxController {
  late CacheManager customCacheManager;
  final userModels = AppPreference().getUserModel();
  var homeStatus = Rx<HomeStatus>(HomeStatus.initial);

  Future<void> logout() async {
    homeStatus.value = HomeStatus.loading;
    Future.delayed(3.seconds, () {
      AppPreference().clearUserModel();
      homeStatus.value = HomeStatus.success;
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  void onInit() {
    customCacheManager = CacheManager(Config('customCacheKey',
        stalePeriod: 15.days, maxNrOfCacheObjects: 100));
    super.onInit();
  }
}
