import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
// import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import '/consts/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/notifications_controller.dart';

class ServicesView extends GetView<NotificationsController> {
  const ServicesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.sizeOf(context).width;
    // final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<NotificationsController>(
        init: NotificationsController(),
        builder: (obj) {
          return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    IconPath.leftArrowIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                title: CustomText(
                  text: notifications,
                  fontWeight: bold5,
                  fontSize: AppStyle.size(context, 21),
                ),
                centerTitle: true,
              ),
              body: const SizedBox());
        });
  }
}
