import 'package:get/get.dart';
import '/consts/assets_paths.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  List<String> iconList = [
    IconPath.googleIcon,
    IconPath.fbIcon,
    IconPath.appleIcon,
  ];
  bool showPassword = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  visibility() {
    showPassword = !showPassword;
    update();
  }

  signUp() {
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(Routes.ABOUT_CHILD);
    }
  }
}
