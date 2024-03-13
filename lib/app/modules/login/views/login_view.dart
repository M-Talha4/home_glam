import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../controllers/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/widgets/custom_text_form_field.dart';
import '../../../../widgets/custom_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height * 0.9,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.065,
                  vertical: height * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: welcomeBackTo,
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
                        text: loginpAsCustomer,
                        textAlign: TextAlign.center,
                        fontSize: AppStyle.subheadingsize(context),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          text: forgotPasswordText,
                          fontWeight: bold5,
                          color: AppColor.primary,
                        )),
                    CustomButton(onTap: () {}, text: loginText),
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
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
