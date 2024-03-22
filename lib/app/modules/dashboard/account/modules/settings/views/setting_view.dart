import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import 'package:flutter/material.dart';
import '../controllers/setting_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../../../../../widgets/custom_text.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: settingsText,
            fontSize: AppStyle.headingsize(context),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<SettingController>(
            init: SettingController(),
            builder: (obj) {
              return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: height * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: obj.settingItems.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                constraints:
                                    BoxConstraints(maxHeight: height * 0.1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: obj.settingItems[index].title,
                                          fontSize:
                                              AppStyle.subheadingsize(context),
                                        ),
                                        SizedBox(
                                          width: width * 0.18,
                                          child: Transform.scale(
                                            scale: 0.7,
                                            child: FlutterSwitch(
                                              onToggle: (value) {
                                                obj.onTap(index);
                                              },
                                              value:
                                                  obj.settingItems[index].isOn,
                                              toggleColor: AppColor.primary,
                                              activeColor: AppColor.lightPink,
                                              inactiveColor: AppColor.lightGrey
                                                  .withOpacity(0.25),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomText(
                                      text: obj.settingItems[index].subTitle,
                                      color: AppColor.grey,
                                      fontSize: AppStyle.smallsize(context),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          TextButton(
                              onPressed: () {},
                              child: CustomText(
                                text: helpCenterText,
                                color: AppColor.primary,
                                fontSize: AppStyle.size(context, 19),
                              )),
                          TextButton(
                              onPressed: () {
                                obj.logout();
                              },
                              child: CustomText(
                                text: logOutText,
                                color: AppColor.primary,
                                fontSize: AppStyle.size(context, 19),
                              )),
                        ],
                      )));
            }),
      ),
    );
  }
}
