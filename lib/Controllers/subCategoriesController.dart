import 'package:get/get.dart';
import 'package:grocery_app/Utils/tempData.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/subCategoryItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubCategoriesConreoller extends GetxController {
  List<SubCategory> subCategories = TempData().subCategories;

  @override
  void onInit() {
    // dataBox.clear();
    super.onInit();
  }
}
