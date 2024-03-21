import 'package:get/get.dart';
import 'package:home_glam/app/routes/app_pages.dart';
import 'package:home_glam/consts/variables.dart';
import 'package:home_glam/utils/sharepreference_helper.dart';

class AccountController extends GetxController {
  String name = SharedPreferencesHelper.getString('name') ?? 'Abc';
  String email = SharedPreferencesHelper.getString('email') ?? 'abc@abc.com';
  String phoneNo =
      SharedPreferencesHelper.getString('phoneNo') ?? '+111111111111';

  logout() {
    FirebaseVariables().auth.signOut();
    SharedPreferencesHelper.remove('userId');
    SharedPreferencesHelper.remove('name');
    SharedPreferencesHelper.remove('email');
    SharedPreferencesHelper.remove('phoneNo');
    Get.toNamed(Routes.LOGIN);
  }
}
