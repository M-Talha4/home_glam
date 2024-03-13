import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/agreement_controller.dart';

class AgreementView extends GetView<AgreementController> {
  const AgreementView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.offNamed(Routes.LOGIN);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left)),
            ),
            body: GetBuilder<AgreementController>(
                init: AgreementController(),
                builder: (obj) {
                  return SizedBox(
                    width: width,
                    height: height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.065, vertical: height * 0.06),
                      child: const Column(),
                    ),
                  );
                })));
  }
}
