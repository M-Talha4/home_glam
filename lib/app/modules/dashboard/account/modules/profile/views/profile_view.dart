import '/utils/style.dart';
import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/app_color.dart';
import '/consts/static_data.dart';
import '/consts/assets_paths.dart';
import '/widgets/custom_text.dart';
import '/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../../widgets/custom_text_form_field.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: profileText,
          fontSize: AppStyle.headingsize(context),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (obj) {
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width * 0.1),
                              topRight: Radius.circular(width * 0.1),
                            )),
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppStyle.defaultPadding(context)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        obj.getGalleryImage();
                                      },
                                      child: Icon(
                                        Icons.image_rounded,
                                        color: AppColor.primary,
                                        size: width * 0.25,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        obj.getCameraImage();
                                      },
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: AppColor.primary,
                                        size: width * 0.25,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: height * 0.16,
                          height: height * 0.16,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: height * 0.08,
                                  backgroundColor: AppColor.primary,
                                  child: ClipOval(
                                      child: obj.image != null
                                          ? Image.file(obj.image!.absolute,
                                              width: height * 0.16,
                                              fit: BoxFit.fitWidth)
                                          : StaticData.profileImage == '' ||
                                                  obj.isConnected == false
                                              ? const SizedBox()
                                              : CachedNetworkImage(
                                                  imageUrl:
                                                      StaticData.profileImage,
                                                  width: height * 0.16,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                        child: SizedBox(
                                                          width: height * 0.04,
                                                          height: height * 0.04,
                                                          child:
                                                              const CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                  fit: BoxFit.fitWidth))),
                              Positioned(
                                  right: width * 0.005,
                                  bottom: height * 0.015,
                                  child: SvgPicture.asset(IconPath.cameraIcon)),
                            ],
                          ),
                        ),
                      ),
                      CustomText(
                        text: StaticData.name,
                        fontSize: AppStyle.subheadingsize(context),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Form(
                        key: obj.formKey,
                        child: ListView.builder(
                          itemCount: obj.profileData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: obj.profileData[index].title,
                                  fontSize: AppStyle.bodysize(context),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                RectangularTextFormField(
                                  controller: obj.profileData[index].controller,
                                  keyboardtype: index == 1
                                      ? TextInputType.phone
                                      : TextInputType.text,
                                  validation: (value) {
                                    return obj.validate(index, value);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.05,
                        ),
                        child: LoadingButton(
                          isLoading: obj.isLoading,
                          onTap: () {
                            obj.uploadImage();
                          },
                          text: updateText,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
