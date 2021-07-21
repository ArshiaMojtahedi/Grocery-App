import 'package:get/get.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/subCategoryItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubCategoriesConreoller extends GetxController {
  List<SubCategory> subCategories = [
    SubCategory(
        title: "kooft and filan",
        image: "assets/images/temp/category1.png",
        color: "53B175"),
    SubCategory(
        title: "kooft and filan",
        image: "assets/images/temp/category1.png",
        color: "53B175"),
    SubCategory(
        title: "kooft and filan",
        image: "assets/images/temp/category1.png",
        color: "53B175"),
  ];

  @override
  void onInit() {
    // dataBox.clear();
    super.onInit();
  }
}
