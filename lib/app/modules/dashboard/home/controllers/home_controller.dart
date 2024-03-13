import 'package:get/get.dart';
import 'package:home_glam/consts/assets_paths.dart';
import 'package:home_glam/consts/const.dart';

class HomeController extends GetxController {
  List<CategoryModel> catItems = [
    CategoryModel(name: faceText, icon: IconPath.faceIcon),
    CategoryModel(name: hairText, icon: IconPath.hairIcon),
    CategoryModel(name: nailsText, icon: IconPath.nailsIcon),
    CategoryModel(name: bodyText, icon: IconPath.bodyIcon),
    CategoryModel(name: hennaText, icon: IconPath.hennaIcon),
    CategoryModel(name: photographyText, icon: IconPath.photographyIcon),
    CategoryModel(name: eventDecorText, icon: IconPath.eventDecorIcon),
    CategoryModel(name: tailoringText, icon: IconPath.tailoringIcon),
  ];
}

class CategoryModel {
  String name;
  String icon;
  CategoryModel({
    required this.name,
    required this.icon,
  });
}
