import 'package:get/get.dart';

import '../controllers/login_email_controller.dart';

class LoginEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginEmailController>(
      () => LoginEmailController(),
    );
  }
}
