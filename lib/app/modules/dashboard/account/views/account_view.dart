import 'package:cached_network_image/cached_network_image.dart';
import 'package:home_glam/consts/static_data.dart';

import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: accountText,
            fontSize: AppStyle.headingsize(context),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<AccountController>(
            init: AccountController(),
            builder: (obj) {
              return SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.05),
                      child: ListView.separated(
                        itemCount: obj.accountItems.length,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: ListTile(
                              onTap: () {
                                obj.onTap(index);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.025)),
                              tileColor: obj.currentIndex == index
                                  ? obj.tileColor
                                  : AppColor.white,
                              leading: index == 0
                                  ? CircleAvatar(
                                      radius: width * 0.06,
                                      backgroundColor: AppColor.primary,
                                      child: ClipOval(
                                          child: StaticData.profileImage ==
                                                      '' ||
                                                  obj.isConnected == false
                                              ? null
                                              : CachedNetworkImage(
                                                  imageUrl: obj
                                                      .accountItems[index]
                                                      .imagePath,
                                                  width: width * 0.12,
                                                  placeholder: (context, url) =>
                                                      const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                )))
                                  : SvgPicture.asset(
                                      obj.accountItems[index].imagePath,
                                      colorFilter: ColorFilter.mode(
                                          obj.currentIndex == index
                                              ? obj.contentColor
                                              : AppColor.black,
                                          BlendMode.srcIn),
                                    ),
                              title: CustomText(
                                text: obj.accountItems[index].title,
                                color: obj.currentIndex == index
                                    ? obj.contentColor
                                    : AppColor.black,
                              ),
                            ),
                          );
                        },
                      )));
            }),
      ),
    );
  }
}
