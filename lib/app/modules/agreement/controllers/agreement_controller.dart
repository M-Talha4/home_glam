import '/consts/const.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

class AgreementController extends GetxController {
  bool agree = false;
  List<String> agreementParas = [
    agreementText1,
    agreementText2,
    agreementText3,
    agreementText4,
    agreementText4,
    agreementText4,
  ];
  ontapCheckBox() {
    agree = !agree;
    update();
  }

  goToHome() {
    Get.offAllNamed(Routes.DASHBOARD);
  }
}
