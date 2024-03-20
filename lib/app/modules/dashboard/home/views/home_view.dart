import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import 'service_section.dart';
import '/consts/app_color.dart';
import '/consts/assets_paths.dart';
import '/widgets/custom_text.dart';
import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '/widgets/custom_text_form_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/views/category_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (obj) {
              return SizedBox(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helloText,
                                style: GoogleFonts.grandHotel(
                                    textStyle: TextStyle(
                                        fontSize: AppStyle.size(context, 27))),
                              ),
                              CustomText(
                                  text: maria,
                                  fontSize: AppStyle.headingsize(context)),
                              const Spacer(),
                              Container(
                                width: height * 0.06,
                                height: height * 0.06,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: AppColor.superLightPink,
                                    borderRadius:
                                        BorderRadius.circular(width * 0.015)),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        IconPath.notificationIcon,
                                        height: height * 0.04,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: height * 0.01,
                                        backgroundColor: AppColor.primary,
                                        child: CustomText(
                                          text: '1',
                                          color: AppColor.white,
                                          fontSize: AppStyle.size(context, 8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: width * 0.7,
                            child: CustomText(
                                text: letsExplore,
                                color: AppColor.grey,
                                fontSize: AppStyle.bodysize(context)),
                          ),
                          Container(
                            height: height * 0.12,
                            alignment: Alignment.center,
                            child: RectangularTextFormField(
                              hint: searchServiesNearYou,
                              hintcolor: AppColor.primary,
                              suffixIcon: SvgPicture.asset(
                                IconPath.searchIcon,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          const CategorySection(),
                          Row(
                            children: [
                              CustomText(
                                text: featureServiceText,
                                fontSize: AppStyle.subheadingsize(context),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.SERVICES,
                                      arguments: 'Featured');
                                },
                                child: CustomText(
                                  text: seeAllText,
                                  color: AppColor.primary,
                                  fontSize: AppStyle.subheadingsize(context),
                                ),
                              ),
                            ],
                          ),
                          const ServiceSection(
                              isFeatured: true,
                              image: ImagePath.cleansingFacial,
                              service: cleansingFacial,
                              provider: janesSpaText,
                              rating: '4.8',
                              price: '60',
                              time: '2 $hourText'),
                          Row(
                            children: [
                              CustomText(
                                text: servicesNearYouText,
                                fontSize: AppStyle.subheadingsize(context),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.SERVICES,
                                      arguments: 'Services Near You');
                                },
                                child: CustomText(
                                  text: seeAllText,
                                  color: AppColor.primary,
                                  fontSize: AppStyle.subheadingsize(context),
                                ),
                              ),
                            ],
                          ),
                          const ServiceSection(
                              isFeatured: false,
                              image: ImagePath.engagementDecor,
                              service: engagementDecortext,
                              provider: julieDecorText,
                              rating: '4.8',
                              price: '300',
                              time: '4 $hourText'),
                        ]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
