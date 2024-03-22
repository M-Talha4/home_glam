import '/utils/toast.dart';
import 'package:get/get.dart';
import '/consts/variables.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import '../../models/user_model.dart';
import 'package:flutter/material.dart';
import '/utils/sharepreference_helper.dart';
import '../../../../consts/assets_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  UserModel userData = UserModel(
      userUid: '',
      name: '',
      email: '',
      phoneNo: '',
      type: '',
      location: '',
      country: '');
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
          phoneNo: data['phoneNo']!,
          type: data['type']!,
          location: data['location']!,
          country: data['country']!);
      SharedPreferencesHelper.setString('userId', userData.userUid);
      SharedPreferencesHelper.setString('name', userData.name);
      SharedPreferencesHelper.setString('email', userData.email);
      SharedPreferencesHelper.setString('phoneNo', userData.phoneNo);
      SharedPreferencesHelper.setString('type', userData.type);
      SharedPreferencesHelper.setString('location', userData.location);
      SharedPreferencesHelper.setString('country', userData.country);
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
