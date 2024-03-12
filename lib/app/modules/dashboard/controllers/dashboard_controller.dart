import '../calender/views/calender_view.dart';
import '../home/views/home_view.dart';
import '../notification/views/notification_view.dart';
import '../setting/views/setting_view.dart';
import '/consts/app_color.dart';
import '/consts/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  changeIndex(int val) {
    currentIndex.value = val;
    update();
  }

  List<Widget> pages = [
    const HomeView(),
    const CalenderView(),
    const NotificationView(),
    const SettingView()
  ];
  List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/home_icon.svg",
          color: AppColor.icon,
          width: 25,
          height: 25,
        ),
        activeIcon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/home_icon.svg",
          width: 30,
          height: 30,
          color: AppColor.black,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/calender_icon.svg",
          width: 25,
          height: 25,
          color: AppColor.icon,
        ),
        activeIcon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/calender_icon.svg",
          width: 30,
          height: 30,
          color: AppColor.black,
        ),
        label: calender),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/notifications_icon.svg",
          color: AppColor.icon,
          width: 25,
          height: 25,
        ),
        activeIcon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/notifications_icon.svg",
          width: 30,
          height: 30,
          color: AppColor.black,
        ),
        label: notification),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/setting_icon.svg",
          width: 25,
          height: 25,
          color: AppColor.icon,
        ),
        activeIcon: SvgPicture.asset(
          fit: BoxFit.cover,
          "assets/icons/setting_icon.svg",
          width: 30,
          color: AppColor.black,
          height: 30,
        ),
        label: setting),
  ];



}
