import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_glam/app/modules/signup/models/signup_model.dart';
import 'package:home_glam/app/routes/app_pages.dart';
import 'package:home_glam/consts/variables.dart';
import 'package:home_glam/utils/sharepreference_helper.dart';
import 'package:home_glam/utils/toast.dart';
import '../../../../consts/assets_paths.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  UserModel userData = UserModel(userUid: '', name: '', email: '', phoneNo: '');
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<String> iconList = [
    IconPath.googleIcon,
    IconPath.fbIcon,
    IconPath.appleIcon,
  ];

  login() async {
    if (formkey.currentState!.validate()) {
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoading = true;
        update();
      });
      try {
        await FirebaseVariables()
            .auth
            .signInWithEmailAndPassword(
                email: emailController.text.toString(),
                password: passwordController.text.toString())
            .then((value) {
          debugPrint('Login Successfull');
          loadData(value.user!.uid);
        }).onError((error, stackTrace) {
          isLoading = false;
          update();
          showToast(message: error.toString(), isError: true);
        });
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        update();
        showToast(message: e.toString(), isError: true);
      } catch (e) {
        isLoading = false;
        update();
        showToast(message: e.toString(), isError: true);
      }
    }
  }

  loadData(uid) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseVariables().userCollection.doc(uid).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      userData = UserModel(
          userUid: data['id']!,
          name: data['name']!,
          email: data['email']!,
          phoneNo: data['phoneNo']!);
      SharedPreferencesHelper.setString('userId', userData.userUid);
      SharedPreferencesHelper.setString('name', userData.name);
      SharedPreferencesHelper.setString('email', userData.email);
      SharedPreferencesHelper.setString('phoneNo', userData.phoneNo);
      isLoading = false;
      update();
      showToast(message: 'Login Successfull', isError: false);
      clear();
      Future.delayed(const Duration(milliseconds: 100), () {
        Get.offAllNamed(Routes.DASHBOARD);
      });
    } catch (e) {
      isLoading = false;
      update();
      showToast(message: e.toString(), isError: true);
    }
  }

  clear() {
    emailController.clear();
    passwordController.clear();
  }
}
