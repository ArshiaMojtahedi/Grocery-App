import 'package:get/get.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartConroller extends GetxController {
  Box<CartItem> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box<CartItem>("cart");
    // dataBox.clear();
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

  increaseItem(int id) {
    CartItem item = dataBox.get(id);
    CartItem newItem = CartItem(
        id: item.id,
        title: item.title,
        image: item.image,
        description: item.description,
        price: item.price,
        amount: item.amount + 1);
    dataBox.put(item.id, newItem);

    update();
  }

  decreaseItem(int id) {
    CartItem item = dataBox.get(id);
    if (item.amount != 1) {
      CartItem newItem = CartItem(
          id: item.id,
          title: item.title,
          image: item.image,
          description: item.description,
          price: item.price,
          amount: item.amount - 1);
      dataBox.put(item.id, newItem);
    } else {
      removeItem(id);
    }
    update();
  }

  removeItem(int id) {
    dataBox.delete(id);
    //dataBox.clear();
    update();
  }

  removeAll() {
    dataBox.clear();
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
      print(dataBox.get(id).amount);
      return dataBox.get(id).amount;
    } else {
      return 0;
    }
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < dataBox.length; i++) {
      total += dataBox.getAt(i).amount * dataBox.getAt(i).price;
    }
    return total;
  }

  List<CartItem> getItemList() {
    List<CartItem> items = [];
    for (int i = 0; i < dataBox.length; i++) {
      items.add(dataBox.getAt(i));

      print(dataBox.getAt(i).title);
    }
    return items;
  }
}
