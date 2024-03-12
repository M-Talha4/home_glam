import '/app/routes/app_pages.dart';
import '/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VarificationController extends GetxController {
  int? code;
  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void onInit() {
    focusNodes = List.generate(4, (index) => FocusNode());
    controllers = List.generate(4, (index) => TextEditingController());
    super.onInit();
  }



  onChanged(BuildContext context, int index) {
    if (index != 0 && controllers[index].text.isEmpty) {
      focusNodes[index - 1].requestFocus();
    }
    if (controllers[index].text.length == 1) {
      if (index == 3) {
        FocusScope.of(context).unfocus();
      } else {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }
  }

  getCode() {
    String val = '';
    for (var i = 0; i <= 3; i++) {
      val = val + controllers[i].text;
    }
    code = int.parse(val);
  }

  verifyCode() {
    getCode();
    if (code != null) {
      Get.offNamed(Routes.NEW_PASSWORD);
    } else {
      showtoast(message: 'Incorrect Code', isError: true);
    }
  }
}
