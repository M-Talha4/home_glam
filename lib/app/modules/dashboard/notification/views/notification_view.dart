import '/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<NotificationController>(
            init: NotificationController(),
            builder: (obj) {
              return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppStyle.defaultPadding(context),
                      ),
                      child: const Column()));
            }),
      ),
    );
  }
}
