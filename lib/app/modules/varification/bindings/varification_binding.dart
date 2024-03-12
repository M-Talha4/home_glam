import 'package:get/get.dart';

import '../controllers/varification_controller.dart';

class VarificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VarificationController>(
      () => VarificationController(),
    );
  }
}
