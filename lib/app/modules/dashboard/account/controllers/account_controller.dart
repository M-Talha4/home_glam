import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';

import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/consts/static_data.dart';
import '/consts/assets_paths.dart';
import '/app/routes/app_pages.dart';
import '../models/account_model.dart';

class AccountController extends GetxController {
  bool profileImage = false;
  bool isConnected = false;
  int? currentIndex;
  Color tileColor = AppColor.lightPink;
  Color contentColor = AppColor.primary;
  List<AccountModel> accountItems = [];
  @override
  onInit() {
    accountItems = [
      AccountModel(
          imagePath: StaticData.profileImage, title: '${StaticData.name} (me)'),
      AccountModel(imagePath: IconPath.favoriteIcon, title: favoriteText),
      AccountModel(imagePath: IconPath.paymentIcon, title: paymentText),
      AccountModel(imagePath: IconPath.settingIcon, title: settingsText),
      AccountModel(
          imagePath: IconPath.termConditionIcon, title: termsAndConditionsText),
    ];
    checkInternetConnectivity();
    super.onInit();
  }

  onTap(index) {
    currentIndex = index;
    update();
    Future.delayed(const Duration(milliseconds: 100), () {
      currentIndex = null;
      update();
      switch (index) {
        case 0:
          Get.toNamed(Routes.PROFILE);
          break;
        case 1:
          // Get.toNamed(Routes.SETTINGS);
          break;
        case 2:
          // Get.toNamed(Routes.SETTINGS);
          break;
        case 3:
          Get.toNamed(Routes.SETTINGS);
          break;
        case 4:
          // Get.toNamed(Routes.SETTINGS);
          break;
        default:
          null;
      }
    });
  }

  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
      update();
    } else {
      isConnected = false;
      update();
    }
  }

  updateScreen() {
    Future.delayed(const Duration(milliseconds: 500), () {
      update();
    });
  }
}
