import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/assets_paths.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class IntroductionController extends GetxController {
  late PageController pageController;
  int currentpage = 0;

  List<IntroListModel> pageViewContent = [
    IntroListModel(
        imagePath: ImagePath.hairStraightinening,
        text: introPageText1,
        subText: introPageSubText1),
    IntroListModel(
        imagePath: ImagePath.gettingMassage,
        text: introPageText2,
        subText: introPageSubText2),
    IntroListModel(
        imagePath: ImagePath.eyeMakeup,
        text: introPageText3,
        subText: introPageSubText3),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  onPageChange(int value) {
    currentpage = value;
    update();
  }

  goToNextScreen() {
    Get.toNamed(Routes.LOCATION_SELECTION);
  }
}

class IntroListModel {
  final String imagePath;
  final String text;
  final String subText;

  IntroListModel(
      {required this.imagePath, required this.text, required this.subText});
}
