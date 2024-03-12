import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.065, vertical: height * 0.04),
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
                    SizedBox(
                      height: height * 0.55,
                      width: width,
                      child: Column(
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
                          CustomText(
                            text: emailText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
                          ),
                          CustomText(
                            text: passwordText,
                            fontSize: AppStyle.bodysize(context),
                          ),
                          RectangularTextFormField(
                            validation: (value) => null,
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
                    ),
                    CustomText(
                      text: or,
                      fontSize: AppStyle.bodysize(context),
                    ),
                    const Row(
                      children: [],
                    ),
                    SizedBox(
                        width: width * 0.4,
                        child: RichText(
                          text: const TextSpan(
                              text: alreadyHaveAccount, children: [TextSpan()]),
                        )
                        // Wrap(
                        //   children: [
                        //     // CustomText(
                        //     //   text: alreadyHaveAccount,
                        //     //   fontSize: AppStyle.bodysize(context),
                        //     // ),
                        //     // CustomText(
                        //     //   text: login,
                        //     //   fontSize: AppStyle.bodysize(context),
                        //     // ),
                        //   ],
                        // ),
                        ),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
