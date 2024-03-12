// ignore_for_file: sort_child_properties_last

import '/consts/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return GetBuilder<DashboardController>(builder: (obj) {
      return Scaffold(
          bottomNavigationBar: SizedBox(
            width: width,
            height: 75,
            child: BottomNavigationBar(
              currentIndex: obj.currentIndex.value,
              onTap: (val) {
                obj.changeIndex(val);
              },
              type: BottomNavigationBarType.fixed,
              items: controller.icons,
              fixedColor: AppColor.icon,
            ),
          ),
          body: IndexedStack(
            children: obj.pages,
            index: obj.currentIndex.value,
          ));
    });
  }
}
