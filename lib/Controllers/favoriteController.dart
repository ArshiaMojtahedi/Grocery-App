import 'package:get/get.dart';
import 'package:grocery_app/models/favoriteItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteController extends GetxController {
  Box<FavoriteItem> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box<FavoriteItem>("favorites");
    //dataBox.clear();

    super.onInit();
  }

  addItem(FavoriteItem item) {
    dataBox.put(item.id, item);

    update();
  }

  removeItem(int id) {
    dataBox.delete(id);
    update();
  }

  bool itemExist(int id) {
    if (dataBox.containsKey(id)) {
      print("true");
      return true;
    } else
      print("false");

    return false;
  }
}
