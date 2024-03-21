import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/assets_paths.dart';
import '../home/views/home_view.dart';
import 'package:flutter/material.dart';
import '../account/views/account_view.dart';
import '../calender/views/calender_view.dart';
import '../notification/views/notification_view.dart';

class DashboardController extends GetxController {
  int currentIndex = 0;
  changeIndex(int val) {
    currentIndex = val;
    update();
  }

  List<Widget> pages = [
    const HomeView(),
    const CalenderView(),
    const NotificationView(),
    const AccountView()
  ];
  List<BottomTabData> tabData = [
    BottomTabData(title: homeText, icon: IconPath.homeIcon),
    BottomTabData(title: categoryText, icon: IconPath.categoryIcon),
    BottomTabData(title: chatText, icon: IconPath.chatIcon),
    BottomTabData(title: accountText, icon: IconPath.userIcon),
  ];
}

class BottomTabData {
  String title;
  String icon;
  BottomTabData({
    required this.title,
    required this.icon,
  });
}
