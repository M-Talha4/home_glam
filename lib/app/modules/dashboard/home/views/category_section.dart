import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../home/controllers/home_controller.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (obj) {
        return SizedBox(
          width: width,
          height: height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: exploreCategories,
                fontSize: AppStyle.subheadingsize(context),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: obj.catItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: height * 0.1,
                  mainAxisSpacing: height * 0.02,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: AppColor.superLightPink,
                          child: SvgPicture.asset(
                            obj.catItems[index].icon,
                            height: height * 0.04,
                          ),
                        ),
                      ),
                      Container(
                        width: width * 0.22,
                        alignment: Alignment.center,
                        child: CustomText(
                          text: obj.catItems[index].name,
                          fontSize: AppStyle.size(context, 11),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
