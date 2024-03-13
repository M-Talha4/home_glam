import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementController extends GetxController {
  bool showPassword = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  visibility() {
    showPassword = !showPassword;
    update();
  }

  login() {
    if (formKey.currentState!.validate()) {
      Get.offAllNamed(Routes.ABOUT_CHILD);
    }
  }
}
