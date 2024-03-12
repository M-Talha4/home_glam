
import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offNamed(Routes.LOGIN_EMAIL);
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      body: GetBuilder<ForgotPasswordController>(
          init: ForgotPasswordController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.065, vertical: height * 0.06),
                child: const Column(),
              ),
            );
          }),
    ));
  }
}
