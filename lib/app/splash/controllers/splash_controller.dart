import 'package:home_glam/utils/sharepreference_helper.dart';

import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> logoAnimation;

  @override
  void onInit() {
    initAnimationController();
    _goToNextScreen();
    super.onInit();
  }

  void initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  _goToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      String userId = SharedPreferencesHelper.getString('userId') ?? '';
      print(SharedPreferencesHelper.getString('userId'));
      if (userId == '') {
        Get.offAllNamed(Routes.INTRO);
      } else {
        Get.offAllNamed(Routes.DASHBOARD);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
