import '../../../../widgets/custom_text.dart';
import '/app/modules/new_password/controllers/new_password_controller.dart';
import '/app/routes/app_pages.dart';
import '/consts/app_color.dart';
import '/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GetBuilder<NewPasswordController>(
          init: NewPasswordController(),
          builder: (obj) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: obj.startLoading
                    ? null
                    : AppBar(
                        leading: IconButton(
                            onPressed: () {
                              Get.offNamed(Routes.FORGOT_PASSWORD);
                            },
                            icon: const Icon(Icons.keyboard_arrow_left)),
                      ),
                body: SizedBox(
                  width: width,
                  height: height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.065, vertical: height * 0.06),
                    child: obj.startLoading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.3,
                                height: width * 0.3,
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      AppColor.loadingGreen.withOpacity(0.3),
                                  color: AppColor.loadingGreen,
                                  strokeWidth: width * 0.035,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              CustomText(
                                text: 'Just a moment',
                                fontSize: AppStyle.headingsize(context),
                              ),
                            ],
                          )
                        : const Column(),
                  ),
                ));
          }),
    );
  }
}
