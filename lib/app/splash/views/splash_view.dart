import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/consts/assets_paths.dart';
import 'package:flutter/material.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColor.lightPink, AppColor.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: FadeTransition(
              opacity: controller.logoAnimation,
              child: Image.asset(
                ImagePath.appLogo,
                width: width * 0.5,
              )),
        ),
      ),
    );
  }
}
