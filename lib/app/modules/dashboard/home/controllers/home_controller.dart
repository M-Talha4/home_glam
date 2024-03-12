import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late PageController pageController;
  int currentIndex = 0;

  List upcomingReminders = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }


}
