import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductController extends GetxController {
  Box<CartItem> dataBox;
  int quantity = 0;
  int id;
  ProductController({this.id});

  @override
  void onInit() {
    dataBox = Hive.box<CartItem>("cart");
    // dataBox.clear();
    setQuantity(id);
    super.onInit();
  }

  addItem(CartItem item) {
    if (!dataBox.containsKey(item.id)) {
      dataBox.put(item.id, item);
    } else {
      item = dataBox.get(item.id);

      CartItem newItem = CartItem(
          id: item.id,
          title: item.title,
          image: item.image,
          description: item.description,
          price: item.price,
          amount: item.amount + 1);
      dataBox.put(item.id, newItem);
    }
    update();
  }

  changeItemQuantity(CartItem item) {
    item = dataBox.get(item.id);

    CartItem newItem = CartItem(
        id: item.id,
        title: item.title,
        image: item.image,
        description: item.description,
        price: item.price,
        amount: quantity);
    dataBox.put(item.id, newItem);

    update();
  }

  increaseItem(int id) {
    quantity++;

    update();
  }

  decreaseItem(int id) {
    if (quantity != 1) {
      quantity--;
    } else {
      null;
    }
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

  int getItemCount(int id) {
    if (itemExist(id)) {
      return dataBox.get(id).amount;
    } else {
      return 1;
    }
  }

  setQuantity(int id) {
    quantity = getItemCount(id);
    update();
  }

  bool quantityCartEqual(int id) {
    if (quantity == dataBox.get(id).amount) {
      return true;
    } else
      return false;
  }

  // getAllItems() {
  //   print(dataBox.getAt(id).title);
  //   update();
  // }
}
