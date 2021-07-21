import 'package:get/get.dart';
import 'package:grocery_app/models/favoriteItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteController extends GetxController {
  Box<FavoriteItem> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box<FavoriteItem>("favorites");
    // dataBox.clear();
    // addItem(FavoriteItem(
    //   title: "sdada",
    //   description: "dsds",
    //   id: 100,
    //   image: "assets/images/temp/item1.png",
    //   price: 400,
    // ));
    super.onInit();
  }

  addItem(FavoriteItem item) {
    FavoriteItem newItem = FavoriteItem(
      id: item.id,
      title: item.title,
      image: item.image,
      description: item.description,
      price: item.price,
    );
    dataBox.put(item.id, newItem);

    update();
  }

  removeItem(int id) {
    dataBox.delete(id);
    //dataBox.clear();
    update();
  }

  bool itemExist(int id) {
    if (dataBox.containsKey(id)) {
      return true;
    } else
      return false;
  }
}
