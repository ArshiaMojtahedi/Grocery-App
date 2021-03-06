import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Widgets/common/twoButtonAlertDialog.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

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
    // Get.rawSnackbar(
    //   margin: EdgeInsets.all(16),
    //   padding: EdgeInsets.all(50),
    //   maxWidth: 100,
    //   snackPosition: SnackPosition.TOP,
    //   backgroundColor: Colors.white,
    //   borderRadius: 25,
    //   animationDuration: Duration(milliseconds: 500),
    //   message: " ",
    //   icon: Container(
    //     color: Colors.white,
    //     child: Lottie.asset('assets/images/lottie/cart_change.json',
    //         fit: BoxFit.fill, repeat: false, reverse: true),
    //   ),
    // );
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
    Get.dialog(
        TwoButtonAlertDialog(
          text: 'Are you sure you want to delete this item from your cart?',
          yesFunction: () {
            dataBox.delete(id);
            update();
            Get.back();
          },
          noFunction: () => Get.back(),
        ),
        barrierDismissible: false);
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
