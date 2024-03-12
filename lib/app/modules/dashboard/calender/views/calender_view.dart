import '/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calender_controller.dart';

class CalenderView extends GetView<CalenderController> {
  const CalenderView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultPadding(context),
              vertical: AppStyle.defaultPadding(context)),
          child: SizedBox(
            width: width,
            height: height,
            child: GetBuilder<CalenderController>(
                init: CalenderController(),
                builder: (obj) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
