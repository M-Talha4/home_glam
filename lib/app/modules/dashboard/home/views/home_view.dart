// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import '/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (obj) {
              return PageView(
                controller: obj.pageController,
                onPageChanged: (value) {
                  obj.currentIndex = value;
                  obj.update();
                },
                children: [
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                  event(context, width, height, obj.upcomingReminders,
                      obj.currentIndex),
                ],
              );
            }),
      ),
    );
  }

  Widget event(BuildContext context, double width, double height, List list,
      int currentIndex) {
    return SizedBox(
        width: width,
        height: height,
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultPadding(context),
            ),
            child: Column()));
  }
}
