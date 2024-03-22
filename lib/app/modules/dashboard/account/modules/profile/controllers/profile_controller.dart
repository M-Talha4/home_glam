import 'package:flutter/cupertino.dart';
import 'package:home_glam/utils/sharepreference_helper.dart';

import '../../../../../../../utils/validation.dart';
import '/utils/toast.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/variables.dart';
import '/consts/static_data.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '/app/modules/models/user_model.dart';
import '/app/modules/dashboard/account/modules/profile/models/profile_model.dart';

class ProfileController extends GetxController {
  bool isLoading = false;
  String? profileImage = '';
  UserModel userData = UserModel(
      userUid: '',
      name: '',
      email: '',
      phoneNo: '',
      type: '',
      location: '',
      country: '');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  List<ProfileModel> profileData = [];

  @override
  void onInit() {
    profileData = [
      ProfileModel(title: nameText, controller: nameController),
      ProfileModel(title: phoneNumberText, controller: phoneNoController),
      ProfileModel(title: emailText, controller: emailController),
      ProfileModel(title: location, controller: locationController),
      ProfileModel(title: countryText, controller: countryController),
    ];
    nameController.text = StaticData.name;
    phoneNoController.text = StaticData.phoneNo;
    emailController.text = StaticData.email;
    locationController.text = StaticData.location;
    countryController.text = StaticData.country;
    super.onInit();
  }

  String? validate(int index, String? value) {
    switch (index) {
      case 0:
        return Validation.fieldvalidation(value, nameText);
      case 1:
        return Validation.phoneNumberValidation(value);
      case 2:
        return Validation.emaiValidation(value);
      case 3:
        return null;
      case 4:
        return Validation.fieldvalidation(value, countryText);
      default:
        return null;
    }
  }

  updateData() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      userData = UserModel(
        userUid: StaticData.uid,
        name: nameController.text.toString(),
        email: emailController.text.toString(),
        phoneNo: phoneNoController.text.toString(),
        type: StaticData.type,
        location: locationController.text.toString(),
        country: countryController.text.toString(),
        // profileImage: profileImage == '' ? profileImage : null
      );
      try {
        await FirebaseVariables()
            .userCollection
            .doc(StaticData.uid)
            .update(userData.toMap())
            .then((value) {
          isLoading = false;
          update();
          sharedPref();
          showToast(message: profileUpdatedText, isError: false);
          Future.delayed(const Duration(milliseconds: 100), () {
            Get.back();
          });
        }).onError((error, stackTrace) {
          isLoading = false;
          update();
          showToast(message: ' onerror${error.toString()}', isError: true);
        });
      } catch (e) {
        isLoading = false;
        update();
        showToast(message: e.toString(), isError: true);
      }
    }
  }

  goToNextScreen() {
    Get.toNamed(Routes.LOCATION_SELECTION);
  }

  sharedPref() {
    SharedPreferencesHelper.setString('name', userData.name);
    SharedPreferencesHelper.setString('email', userData.email);
    SharedPreferencesHelper.setString('phoneNo', userData.phoneNo);
    SharedPreferencesHelper.setString('location', userData.location);
    SharedPreferencesHelper.setString('country', userData.country);
    if (userData.profileImage != null) {
      SharedPreferencesHelper.setString('imagePath', userData.profileImage!);
    }
    StaticData.name = SharedPreferencesHelper.getString('name')!;
    StaticData.email = SharedPreferencesHelper.getString('email')!;
    StaticData.phoneNo = SharedPreferencesHelper.getString('phoneNo')!;
    StaticData.location = SharedPreferencesHelper.getString('location')!;
    StaticData.country = SharedPreferencesHelper.getString('country')!;
    if (userData.profileImage != null) {
      StaticData.imagePath = SharedPreferencesHelper.getString('imagePath')!;
    }
  }
}
