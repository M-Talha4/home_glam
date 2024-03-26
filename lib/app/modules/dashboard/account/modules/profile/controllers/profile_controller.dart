import 'dart:io';
import '/utils/toast.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/variables.dart';
import '/consts/static_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '/utils/sharepreference_helper.dart';
import '/app/modules/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../utils/validation.dart';
import '../../../controllers/account_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '/app/modules/dashboard/account/modules/profile/models/profile_model.dart';

class ProfileController extends GetxController {
  AccountController accountController = Get.find<AccountController>();

  File? image;
  final imagePicker = ImagePicker();
  bool isLoading = false;
  bool isConnected = false;

  UserModel userData = UserModel(
      userUid: '',
      name: '',
      email: '',
      phoneNo: '',
      type: '',
      location: '',
      country: '',
      profileImage: '');

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
    checkInternetConnectivity();
    super.onInit();
  }

// .......................Validate Fields............................
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

  // ........................Get Gallery Image................................
  Future<void> getGalleryImage() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    update();
    if (pickedImage != null) {
      image = File(pickedImage.path);
      Get.back();
    } else {
      print('No Image Picked');
    }
  }

  // ........................Get Camera Image................................
  Future<void> getCameraImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      Get.back();
    } else {
      print('No Image Picked');
    }
  }

  // ........................Upload Image................................
  Future<void> uploadImage() async {
    isLoading = true;
    update();
    if (image != null) {
      //Storage reference
      Reference storageProfileReference = FirebaseStorage.instance
          .ref('/ProfileImages/${StaticData.uid}_profile_image.png');
      UploadTask uploadTask = storageProfileReference.putFile(image!.absolute);
      //upload image
      await Future.value(uploadTask).then((value) async {
        final newUrl = await storageProfileReference.getDownloadURL();
        userData = UserModel(
            userUid: StaticData.uid,
            name: nameController.text.toString(),
            email: emailController.text.toString(),
            phoneNo: phoneNoController.text.toString(),
            type: StaticData.type,
            location: locationController.text.toString(),
            country: countryController.text.toString(),
            profileImage: newUrl);

        await FirebaseVariables()
            .userCollection
            .doc(StaticData.uid)
            .update(userData.toMap())
            .then((value) {
          isLoading = false;
          update();
          sharedPref();
          showToast(message: profileUpdatedText, isError: false);
          Get.back();
        }).onError((error, stackTrace) {
          isLoading = false;
          update();
          showToast(message: error.toString(), isError: true);
        });
      }).onError((error, stackTrace) {
        isLoading = false;
        update();
        showToast(message: error.toString(), isError: true);
      });
    } else {
      updateData();
    }
  }

  updateData() async {
    if (formKey.currentState!.validate()) {
      try {
        userData = UserModel(
            userUid: StaticData.uid,
            name: nameController.text.toString(),
            email: emailController.text.toString(),
            phoneNo: phoneNoController.text.toString(),
            type: StaticData.type,
            location: locationController.text.toString(),
            country: countryController.text.toString(),
            profileImage: '');
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

  sharedPref() {
    SharedPreferencesHelper.setString('name', userData.name);
    SharedPreferencesHelper.setString('email', userData.email);
    SharedPreferencesHelper.setString('phoneNo', userData.phoneNo);
    SharedPreferencesHelper.setString('location', userData.location);
    SharedPreferencesHelper.setString('country', userData.country);
    SharedPreferencesHelper.setString('profileImage', userData.profileImage);

    StaticData.name = SharedPreferencesHelper.getString('name')!;
    StaticData.email = SharedPreferencesHelper.getString('email')!;
    StaticData.phoneNo = SharedPreferencesHelper.getString('phoneNo')!;
    StaticData.location = SharedPreferencesHelper.getString('location')!;
    StaticData.country = SharedPreferencesHelper.getString('country')!;
    StaticData.profileImage =
        SharedPreferencesHelper.getString('profileImage')!;
  }

  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
      update();
    } else {
      isConnected = false;
      update();
    }
  }

  @override
  void onClose() {
    accountController.updateScreen();
    checkInternetConnectivity();
    super.onClose();
  }
}
