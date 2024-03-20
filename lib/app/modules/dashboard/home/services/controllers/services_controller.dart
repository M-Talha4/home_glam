import '/consts/const.dart';
import 'package:get/get.dart';
import '/consts/assets_paths.dart';
import '../model/services_model.dart';

class ServicesController extends GetxController {
  String? title = Get.arguments;
  bool isFeatured = false;

  List<ServicesModel> featured = [
    ServicesModel(
        image: ImagePath.cleansingFacial,
        service: cleansingFacial,
        provider: janesSpaText,
        rating: '4.8',
        price: '\$ 60',
        time: '2 $hourText'),
    ServicesModel(
        image: ImagePath.birthdayDecor,
        service: birthdayDecor,
        provider: eventDecorByRs,
        rating: '4.8',
        price: '\$ 200',
        time: '2 $hourText'),
    ServicesModel(
        image: ImagePath.bridalShowerSetup,
        service: bridalShowerSetup,
        provider: julieDecorText,
        rating: '4.8',
        price: '\$ 300',
        time: '2 $hourText'),
  ];
  List<ServicesModel> serviceNearYou = [
    ServicesModel(
        image: ImagePath.engagementDecor,
        service: engagementDecortext,
        provider: julieDecorText,
        rating: '4.8',
        price: '\$ 60',
        time: '2 $hourText'),
    ServicesModel(
        image: ImagePath.weddingPhotography,
        service: weddingPhotography,
        provider: diaCaptures,
        rating: '4.8',
        price: '\$ 400',
        time: '2 $hourText'),
    ServicesModel(
        image: ImagePath.turmericCleansingFacial,
        service: turmericCleansingFacial,
        provider: janesSpaText,
        rating: '4.8',
        price: '\$ 150',
        time: '2 $hourText'),
  ];
  @override
  void onInit() {
    isFeatured = title == 'Featured';
    super.onInit();
  }
}
