import '/consts/const.dart';
import '/utils/style.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import '/consts/assets_paths.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_text_form_field.dart';
import '../controllers/location_select_controller.dart';

class LocationSelectView extends GetView<LocationSelectController> {
  const LocationSelectView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LocationSelectController>(
          init: LocationSelectController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.085, vertical: height * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      ImagePath.appLogo,
                      width: width * 0.42,
                    ),
                    SizedBox(
                      width: width * 0.65,
                      child: CustomText(
                        text: chooseCountry,
                        textAlign: TextAlign.center,
                        fontSize: AppStyle.subheadingsize(context),
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      decoration: BoxDecoration(
                          color: AppColor.lightPink,
                          borderRadius: BorderRadius.circular(width * 0.015)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                        onChanged: (value) {
                          obj.onCountrySelect(value);
                        },
                        value: obj.selectedCountry,
                        isExpanded: true,
                        dropdownColor: AppColor.lightPink,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: width * 0.08,
                          color: AppColor.black,
                        ),
                        items: obj.dropdownItems.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: CustomText(text: e),
                          );
                        }).toList(),
                      )),
                    ),
                    RectangularTextFormField(
                      controller: obj.locationController,
                      hint: location,
                      fillColor: AppColor.lightPink,
                    ),
                    SizedBox(
                      width: width * 0.65,
                      child: CustomText(
                        text: buisnessOrCustomer,
                        textAlign: TextAlign.center,
                        fontSize: AppStyle.subheadingsize(context),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        obj.onTypeSelect(buisnessShop);
                      },
                      child: Container(
                        height: height * 0.09,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.lightPink,
                            borderRadius: BorderRadius.circular(width * 0.015)),
                        child: CustomText(
                          text: buisnessShop,
                          fontSize: AppStyle.bodysize(context),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        obj.onTypeSelect(customer);
                      },
                      child: Container(
                        height: height * 0.09,
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.lightPink,
                            borderRadius: BorderRadius.circular(width * 0.015)),
                        child: CustomText(
                          text: customer,
                          fontSize: AppStyle.bodysize(context),
                        ),
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
