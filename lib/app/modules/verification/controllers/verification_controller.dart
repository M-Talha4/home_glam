import '/utils/toast.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:home_glam/consts/const.dart';

class VerificationController extends GetxController {
  String? code;
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    focusNodes = List.generate(6, (index) => FocusNode());
    controllers = List.generate(6, (index) => TextEditingController());
    super.onInit();
  }

  onChanged(BuildContext context, int index) {
    if (index != 0 && controllers[index].text.isEmpty) {
      focusNodes[index - 1].requestFocus();
    }
    if (controllers[index].text.length == 1) {
      if (index == 5) {
        FocusScope.of(context).unfocus();
      } else {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }
  }

  getCode() {
    String val = '';
    for (var i = 0; i <= 5; i++) {
      val = val + controllers[i].text;
    }
    code = val;
  }

  verifyCode() {
    if (formKey.currentState!.validate()) {
      getCode();
      if (code != null) {
        for (var controller in controllers) {
          controller.clear();
        }
        Get.toNamed(Routes.AGREEMENT);
      } else {
        showtoast(message: incorrectCode, isError: true);
      }
    } else {
      showtoast(message: fillAllFields, isError: true);
    }
  }
}
