import 'package:firebase_auth/firebase_auth.dart';
import '../../signup/models/signup_model.dart';
import '/consts/variables.dart';
import '/utils/toast.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '/consts/const.dart';

class VerificationController extends GetxController {
  int resendToken = Get.arguments[0]['resendToken'];
  String verificationId = Get.arguments[1]['verificationId'];
  UserModel userData = Get.arguments[2]['userData'];
  // PhoneAuthCredential
  String code = '';
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

  verifyCode() async {
    if (formKey.currentState!.validate()) {
      getCode();

      for (var controller in controllers) {
        controller.clear();
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      await FirebaseVariables()
          .auth
          .signInWithCredential(credential)
          .then((value) {
        showToast(message: 'Verification Completed', isError: false);
        userData.userUid = value.user!.uid;
        storeUserData();
      }).onError((error, stackTrace) {
        showToast(message: error.toString(), isError: true);
      });
    } else {
      showToast(message: fillAllFields, isError: true);
    }
  }

  storeUserData() async {
    await FirebaseVariables().userCollection.doc().set({
      'id': userData.userUid,
      'name': userData.name,
      'email': userData.email,
      'phoneNo': userData.phoneNo,
    }).then((value) {
      showToast(message: 'Account Created', isError: false);
      Future.delayed(const Duration(milliseconds: 200),
          () => Get.toNamed(Routes.AGREEMENT));
    }).onError((error, stackTrace) {
      showToast(message: error.toString(), isError: true);
    });
  }
}
