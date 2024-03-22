import '/utils/toast.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import '/utils/sharepreference_helper.dart';

class LocationSelectController extends GetxController {
  String selectedCountry = selectCountry;
  TextEditingController locationController = TextEditingController();
  List<String> dropdownItems = [
    selectCountry,
    countryList1,
    countryList2,
    countryList3,
  ];
  onCountrySelect(value) {
    selectedCountry = value!;
    update();
  }

  onTypeSelect(String value) {
    if (selectedCountry == selectCountry) {
      showToast(message: pleaseSelectCountry, isError: true);
    } else {
      if (value == customer) {
        SharedPreferencesHelper.setString('type', value);
        SharedPreferencesHelper.setString('country', selectedCountry);
        SharedPreferencesHelper.setString(
            'location', locationController.text.toString());
        Get.toNamed(Routes.SIGNUP);
      } else {
        SharedPreferencesHelper.setString('type', value);
        SharedPreferencesHelper.setString('country', selectedCountry);
        SharedPreferencesHelper.setString(
            'location', locationController.text.toString());
        Get.toNamed(Routes.SIGNUP);
      }
    }
  }
}
