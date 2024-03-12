import '/consts/const.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

class LocationSelectController extends GetxController {
  String selectedCountry = selectCountry;
  List<String> dropdownItems = [
    selectCountry,
    countryList1,
    countryList2,
    countryList3,
  ];

  onTypeSelect(String value) {
    if (value == customer) {
      Get.toNamed(Routes.LOGIN);
    } else {}
    update();
  }
}
