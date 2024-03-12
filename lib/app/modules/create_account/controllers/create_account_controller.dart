import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
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
