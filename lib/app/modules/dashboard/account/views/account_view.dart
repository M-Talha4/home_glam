import 'package:home_glam/consts/app_color.dart';
import 'package:home_glam/consts/const.dart';
import 'package:home_glam/widgets/custom_button.dart';
import 'package:home_glam/widgets/custom_text.dart';

import '/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AccountController>(
            init: AccountController(),
            builder: (obj) {
              return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppStyle.defaultPadding(context),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.2,
                              color: AppColor.amber,
                            ),
                            CustomText(text: obj.name),
                            CustomText(text: obj.email),
                            CustomText(text: obj.phoneNo),
                            CustomButton(
                                onTap: () {
                                  obj.logout();
                                },
                                text: logOut)
                          ])));
            }),
      ),
    );
  }
}
