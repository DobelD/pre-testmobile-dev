import 'package:get/get.dart';

import '../../../../presentation/program/controllers/program.controller.dart';

class ProgramControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramController>(
      () => ProgramController(),
    );
  }
}
