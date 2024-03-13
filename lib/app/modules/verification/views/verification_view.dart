import 'package:get/get.dart';
import '../../../../utils/style.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_color.dart';
import 'package:home_glam/consts/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_glam/consts/assets_paths.dart';
import 'package:home_glam/widgets/custom_text.dart';
import '../controllers/verification_controller.dart';
import 'package:home_glam/widgets/custom_button.dart';
import '../../../../widgets/custom_text_form_field.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});
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
          text: verification,
          fontWeight: bold5,
          fontSize: AppStyle.size(context, 21),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<VerificationController>(
          init: VerificationController(),
          builder: (obj) {
            return SizedBox(
                width: width,
                height: height,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.075, vertical: height * 0.06),
                    child: Column(children: [
                      SizedBox(
                        height: height * 0.12,
                        width: width * 0.6,
                        child: CustomText(
                          text: enterOTPSent,
                          textAlign: TextAlign.center,
                          fontSize: AppStyle.subheadingsize(context),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText(
                          text: enterOTPText,
                          textAlign: TextAlign.center,
                          fontSize: AppStyle.subheadingsize(context),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                          width: width * 0.7,
                          child: codeVerification(obj, width, context)),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      CustomButton(
                          onTap: () {
                            obj.verifyCode();
                          },
                          text: verifyText),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: resendCode,
                          fontWeight: bold5,
                          color: AppColor.primary,
                          fontSize: AppStyle.bodysize(context),
                        ),
                      ),
                      const Spacer()
                    ])));
          }),
    ));
  }

  Widget codeVerification(
      VerificationController obj, double width, BuildContext context) {
    return Form(
      key: obj.formKey,
      child: Row(
        children: [
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[0],
            focusNode: obj.focusNodes[0],
            onChanged: (value) {
              obj.onChanged(context, 0);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[1],
            focusNode: obj.focusNodes[1],
            onChanged: (value) {
              obj.onChanged(context, 1);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[2],
            focusNode: obj.focusNodes[2],
            onChanged: (value) {
              obj.onChanged(context, 2);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[3],
            focusNode: obj.focusNodes[3],
            onChanged: (value) {
              obj.onChanged(context, 3);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[4],
            focusNode: obj.focusNodes[4],
            onChanged: (value) {
              obj.onChanged(context, 4);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
              child: VerifyCodeField(
            controller: obj.controllers[5],
            focusNode: obj.focusNodes[5],
            onChanged: (value) {
              obj.onChanged(context, 5);
            },
          )),
          SizedBox(
            width: width * 0.01,
          ),
        ],
      ),
    );
  }
}
