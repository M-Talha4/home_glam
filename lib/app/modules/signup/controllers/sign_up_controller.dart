import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../signup/models/signup_model.dart';
import '/consts/variables.dart';
import '/utils/toast.dart';
import '/consts/assets_paths.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  bool? showPassword;
  UserModel userData = UserModel(userUid: '', name: '', email: '', phoneNo: '');
  List<String> iconList = [
    IconPath.googleIcon,
    IconPath.fbIcon,
    IconPath.appleIcon,
  ];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  visibility() {
    showPassword = !showPassword!;
    update();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoading = true;
        update();
      });
      try {
        await FirebaseVariables()
            .auth
            .verifyPhoneNumber(
                phoneNumber: phoneController.text.toString(),
                verificationCompleted: (phoneAuthCredential) {},
                verificationFailed: (e) {
                  isLoading = false;
                  update();
                  showToast(
                      message: 'Firebase Error: ${e.message}', isError: true);
                },
                codeSent: (verificationId, forceResendingToken) {
                  isLoading = false;
                  update();
                  showToast(message: 'Code sent', isError: false);
                  print('verificationId: $verificationId');
                  userData = UserModel(
                      userUid: verificationId,
                      name: nameController.text.toString(),
                      email: nameController.text.toString(),
                      phoneNo: phoneController.text.toString());

                  Get.toNamed(Routes.VERIFICATION, arguments: [
                    {'resendToken': forceResendingToken},
                    {'verificationId': verificationId},
                    {'userData': userData},
                  ]);
                },
                codeAutoRetrievalTimeout: (e) {
                  showToast(message: e.toString(), isError: false);
                })
            .then((value) {
          isLoading = false;
          update();
          // showToast(message: 'Succssful', isError: false);
        });
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        update();
        showToast(message: 'firebase issue ${e.code} ', isError: true);
      } catch (e) {
        isLoading = false;
        update();
        showToast(message: 'catch issue ${e.toString()} ', isError: true);
      }
    }
  }
}
