import '/utils/style.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import '/consts/assets_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../home/controllers/home_controller.dart';

class ServiceSection extends StatelessWidget {
  final String image;
  final String service;
  final String provider;
  final String rating;
  final String price;
  final String time;
  const ServiceSection(
      {super.key,
      required this.image,
      required this.service,
      required this.provider,
      required this.rating,
      required this.price,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (obj) {
        return Padding(
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.04),
          child: Container(
            height: height * 0.32,
            width: width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColor.lightGrey,
                offset: const Offset(5, 5),
                blurRadius: 10,
              )
            ]),
            child: Stack(
              children: [
                Image.asset(
                  image,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.88,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.01),
                    decoration: BoxDecoration(
                      color: AppColor.superLightPink,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: service,
                              fontSize: AppStyle.bodysize(context),
                            ),
                            const Spacer(),
                            SvgPicture.asset(IconPath.starIcon),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            CustomText(
                              text: rating,
                              fontSize: AppStyle.bodysize(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: provider,
                              color: AppColor.grey,
                              fontSize: AppStyle.smallsize(context),
                            ),
                            const Spacer(),
                            CustomText(
                              text: '\$ $price',
                              color: AppColor.primary,
                              fontSize: AppStyle.smallsize(context),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            CustomText(
                              text: time,
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
    );
  }
}
