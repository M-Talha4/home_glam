import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  sendOtp() {
    if (formKey.currentState!.validate()) {
      Get.offNamed(Routes.VERIFICATION);
    }
  }
}
