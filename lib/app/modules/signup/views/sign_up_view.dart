import 'package:get/get.dart';
import '/app/routes/app_pages.dart';
import '/widgets/custom_button.dart';
import '../../../../utils/style.dart';
import 'package:flutter/gestures.dart';
import '../../../../consts/const.dart';
import 'package:flutter/material.dart';
import '../../../../consts/app_color.dart';
import '../../../../widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/sign_up_controller.dart';
import '../../../../widgets/custom_text_form_field.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<SignUpController>(
          init: SignUpController(),
          builder: (obj) {
            return SingleChildScrollView(
              child: SizedBox(
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.065,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: welcomeTo,
                        fontWeight: bold5,
                        color: AppColor.black54,
                        fontSize: AppStyle.size(context, 22),
                      ),
                      CustomText(
                        text: appName,
                        fontWeight: bold,
                        color: AppColor.primary,
                        fontSize: AppStyle.headingsize(context),
                      ),
                      SizedBox(
                        width: width * 0.6,
                        child: CustomText(
                          text: signUpAsCustomer,
                          textAlign: TextAlign.center,
                          fontSize: AppStyle.subheadingsize(context),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: nameText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomText(
                            text: emailText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomText(
                            text: passwordText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomText(
                            text: phoneNumberText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomButton(
                          onTap: () {
                            Get.toNamed(Routes.VERIFICATION);
                          },
                          text: signupText),
                      CustomText(
                        text: or,
                        fontSize: AppStyle.bodysize(context),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: obj.iconList.asMap().entries.map((e) {
                            String path = e.value;
                            return InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                  radius: height * 0.025,
                                  backgroundColor: AppColor.lightGrey,
                                  child: SvgPicture.asset(
                                    path,
                                    height: height * 0.035,
                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                          width: width * 0.3,
                          child: RichText(
                            text: TextSpan(
                                text: alreadyHaveAccount,
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: AppStyle.bodysize(context),
                                ),
                                children: [
                                  TextSpan(
                                      text: loginText,
                                      style: TextStyle(
                                        color: AppColor.primary,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Get.toNamed(Routes.LOGIN))
                                ]),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
