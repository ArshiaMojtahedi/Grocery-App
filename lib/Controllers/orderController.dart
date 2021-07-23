import 'package:get/get.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/orderItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderController extends GetxController {
  Box<OrderItem> dataBox;

  @override
  void onInit() {
    dataBox = Hive.box<OrderItem>("orders");
    // dataBox.clear();
    super.onInit();
  }

  addOrder(OrderItem order) {
    dataBox.put(order.id, order);
  }

  getOrders() {
    print("Count: " + dataBox.length.toString());
    for (int i = 0; i < dataBox.length; i++) {
      for (int j = 0; j < dataBox.getAt(i).items.length; j++) {
        print("Item $j: " + dataBox.getAt(i).items[j].title);
      }
    }
  }
}
