import '/utils/style.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (obj) {
          return Scaffold(
            body: obj.pages[obj.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (val) => obj.changeIndex(val),
              currentIndex: obj.currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.primary,
              unselectedItemColor: AppColor.black,
              backgroundColor: AppColor.superLightPink,
              unselectedFontSize: AppStyle.smallsize(context),
              selectedFontSize: AppStyle.smallsize(context),
              items: obj.tabData.asMap().entries.map((e) {
                int index = e.key;
                String title = e.value.title;
                String icon = e.value.icon;

                return BottomNavigationBarItem(
                  label: title,
                  icon: SvgPicture.asset(
                    icon,
                    height: height * 0.036,
                    colorFilter: ColorFilter.mode(
                        obj.currentIndex == index
                            ? AppColor.primary
                            : AppColor.black,
                        BlendMode.srcIn),
                  ),
                );
              }).toList(),
            ),
          );
        });
  }
}
