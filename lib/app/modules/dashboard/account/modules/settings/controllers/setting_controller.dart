import '/consts/const.dart';
import 'package:get/get.dart';
import '../models/setting_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../../consts/variables.dart';
import '../../../../../../../utils/sharepreference_helper.dart';

class SettingController extends GetxController {
  int? currentIndex;
  bool? isTrue;
  List<SettingModel> settingItems = [
    SettingModel(
        title: systemNotifications,
        subTitle: receiveUpdatesonServices,
        isOn: false),
    SettingModel(
        title: promoMessages, subTitle: receiveUpdatesOnDeals, isOn: false),
    SettingModel(title: chatsText, subTitle: receiveInAppMessages, isOn: false),
    SettingModel(
        title: locationVisibility,
        subTitle: allowLocationVisibility,
        isOn: true),
  ];
  onTap(index) {
    settingItems[index].isOn = !settingItems[index].isOn;
    update();
  }

  logout() {
    FirebaseVariables().auth.signOut();
    SharedPreferencesHelper.remove('userId');
    SharedPreferencesHelper.remove('name');
    SharedPreferencesHelper.remove('email');
    SharedPreferencesHelper.remove('phoneNo');
    SharedPreferencesHelper.remove('imagePath');
    Get.toNamed(Routes.LOGIN);
  }
}
