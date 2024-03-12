import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../controllers/intro_controller.dart';
import '../../../../widgets/custom_button.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<IntroductionController>(
          init: IntroductionController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * 0.85,
                    child: PageView.builder(
                      controller: obj.pageController,
                      onPageChanged: (value) {
                        obj.onPageChange(value);
                      },
                      itemCount: obj.pageViewContent.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              obj.pageViewContent[index].imagePath,
                              width: width,
                              height: height * 0.62,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(),
                            CustomText(
                              text: obj.pageViewContent[index].text,
                              color: AppColor.primary,
                              fontWeight: bold,
                              fontSize: AppStyle.subheadingsize(context),
                            ),
                            SizedBox(
                              width: width * 0.9,
                              child: CustomText(
                                text: obj.pageViewContent[index].subText,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Wrap(
                              spacing: width * 0.01,
                              children:
                                  obj.pageViewContent.asMap().entries.map((e) {
                                int index = e.key;
                                return Container(
                                  height: height * 0.01,
                                  width: obj.currentpage == index
                                      ? width * 0.065
                                      : width * 0.032,
                                  decoration: BoxDecoration(
                                      color: obj.currentpage == index
                                          ? AppColor.primary
                                          : AppColor.lightGrey,
                                      borderRadius: BorderRadius.circular(5)),
                                );
                              }).toList(),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.04),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Visibility(
                            visible: obj.currentpage == 2,
                            child: CustomButton(
                                onTap: () {
                                  obj.goToNextScreen();
                                },
                                isBig: false,
                                text: getStarted))),
                  ),
                ],
              ),
            );
          }),
    ));
  }
}
