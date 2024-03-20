import '/utils/style.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import '/consts/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<ServicesController>(
        init: ServicesController(),
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
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: obj.title!,
                      fontWeight: bold5,
                      fontSize: AppStyle.size(context, 21),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    obj.isFeatured
                        ? Positioned(
                            right: width * 0.05,
                            child: SvgPicture.asset(
                              IconPath.featuredLabel,
                              fit: BoxFit.scaleDown,
                            ))
                        : const SizedBox(),
                  ],
                ),
                centerTitle: true,
              ),
              body: ListView.separated(
                itemCount: obj.isFeatured
                    ? obj.featured.length
                    : obj.serviceNearYou.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.05,
                  );
                },
                itemBuilder: (context, index) {
                  var list = obj.isFeatured ? obj.featured : obj.serviceNearYou;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Container(
                      height: height * 0.32,
                      width: width,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColor.lightGrey.withOpacity(0.5),
                          offset: const Offset(3, 3),
                          blurRadius: 12,
                        )
                      ]),
                      child: Stack(
                        children: [
                          Image.asset(
                            list[index].image,
                          ),
                          obj.isFeatured
                              ? Positioned(
                                  right: width * 0.05,
                                  child:
                                      SvgPicture.asset(IconPath.featuredLabel))
                              : const SizedBox(),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.88,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.01),
                              decoration: BoxDecoration(
                                color: AppColor.superLightPink,
                                borderRadius:
                                    BorderRadius.circular(width * 0.03),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: list[index].service,
                                        fontSize: AppStyle.bodysize(context),
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(IconPath.starIcon),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      CustomText(
                                        text: list[index].rating,
                                        fontSize: AppStyle.bodysize(context),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: list[index].provider,
                                        color: AppColor.grey,
                                        fontSize: AppStyle.smallsize(context),
                                      ),
                                      const Spacer(),
                                      CustomText(
                                        text: list[index].price,
                                        color: AppColor.primary,
                                        fontSize: AppStyle.smallsize(context),
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      CustomText(
                                        text: list[index].time,
                                        color: AppColor.primary,
                                        fontSize: AppStyle.smallsize(context),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
        });
  }
}
