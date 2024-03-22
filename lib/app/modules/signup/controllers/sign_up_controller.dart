import '/utils/toast.dart';
import 'package:get/get.dart';
import '/consts/variables.dart';
import '/consts/assets_paths.dart';
import '/app/routes/app_pages.dart';
import '../../models/user_model.dart';
import 'package:flutter/material.dart';
import '/utils/sharepreference_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  bool isLoading = false;
  bool? showPassword;
  UserModel userData = UserModel(
      userUid: '',
      name: '',
      email: '',
      phoneNo: '',
      type: '',
      location: '',
      country: '');
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

  signUpWithEmail() async {
    if (formKey.currentState!.validate()) {
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoading = true;
        update();
      });
      try {
        await FirebaseVariables()
            .auth
            .createUserWithEmailAndPassword(
                email: emailController.text.toString(),
                password: passwordController.text.toString())
            .then((value) {
          userData = UserModel(
              userUid: value.user!.uid,
              name: nameController.text.toString(),
              email: emailController.text.toString(),
              phoneNo: phoneController.text.toString(),
              type: SharedPreferencesHelper.getString('type')!,
              location: SharedPreferencesHelper.getString('location')!,
              country: SharedPreferencesHelper.getString('country')!);
          debugPrint('uid ${userData.userUid}');
          debugPrint('Account Created');
          storeCredentials();
        }).onError((error, stackTrace) {
          isLoading = false;
          update();
          showToast(message: error.toString(), isError: true);
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

  signUpWithPhone() async {
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
                  debugPrint('verificationId: $verificationId');
                  userData = UserModel(
                      userUid: '',
                      name: nameController.text.toString(),
                      email: nameController.text.toString(),
                      phoneNo: phoneController.text.toString(),
                      type: SharedPreferencesHelper.getString('type')!,
                      location: SharedPreferencesHelper.getString('location')!,
                      country: SharedPreferencesHelper.getString('country')!);

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

  storeCredentials() {
    try {
      FirebaseVariables()
          .userCollection
          .doc(userData.userUid)
          .set(userData.toMap())
          .then((value) {
        SharedPreferencesHelper.setString('userId', userData.userUid);
        SharedPreferencesHelper.setString('name', userData.name);
        SharedPreferencesHelper.setString('email', userData.email);
        SharedPreferencesHelper.setString('phoneNo', userData.phoneNo);
        showToast(message: 'SignUp Successfull', isError: false);
        isLoading = false;
        update();
        clear();
        Future.delayed(const Duration(milliseconds: 100), () {
          Get.toNamed(Routes.AGREEMENT);
        });
      }).onError((error, stackTrace) {
        isLoading = false;
        update();
        showToast(message: error.toString(), isError: true);
      });
    } catch (e) {
      isLoading = false;
      update();
      showToast(message: 'catch issue ${e.toString()} ', isError: true);
    }
  }

  clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }
}
