import 'package:get/get.dart';
import '../../../../utils/style.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../consts/const.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_color.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../consts/assets_paths.dart';
import '../../../../widgets/custom_button.dart';
import '../controllers/agreement_controller.dart';

class AgreementView extends GetView<AgreementController> {
  const AgreementView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
          text: agreement,
          fontWeight: bold5,
          fontSize: AppStyle.size(context, 21),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AgreementController>(
          init: AgreementController(),
          builder: (obj) {
            return SizedBox(
                width: width,
                height: height,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height * 0.7,
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: obj.agreementParas.length,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: height * 0.01,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return CustomText(
                                    text: obj.agreementParas[index],
                                    fontSize: AppStyle.size(context, 18),
                                  );
                                }),
                          ),
                          InkWell(
                            onTap: () => obj.ontapCheckBox(),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  IconPath.checkBoxIcon,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: ColorFilter.mode(
                                      obj.agree
                                          ? AppColor.primary
                                          : AppColor.grey,
                                      BlendMode.srcIn),
                                ),
                                SizedBox(
                                  width: width * 0.015,
                                ),
                                const CustomText(text: iAgreeStatement)
                              ],
                            ),
                          ),
                          obj.agree
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomButton(
                                    onTap: () => obj.goToHome(),
                                    text: next,
                                    isBig: false,
                                  ),
                                )
                              : SizedBox(
                                  height: height * 0.065,
                                ),
                          const SizedBox(),
                        ])));
          }),
    ));
  }
}
