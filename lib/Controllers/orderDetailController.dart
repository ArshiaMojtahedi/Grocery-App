import 'package:get/get.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/orderItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderDetailController extends GetxController {
  OrderDetailController({this.id});
  Box<OrderItem> dataBox;
  String id;
  OrderItem item;
  List<CartItem> items;

  @override
  void onInit() {
    dataBox = Hive.box<OrderItem>("orders");
    // dataBox.clear();
    getOrder(id);
    super.onInit();
  }

  getOrder(String id) {
    print(id);
    item = dataBox.get(id);
    //  for (int i = 0; i < item.items.length; i++) {
    //   for (int j = 0; j < dataBox.getAt(i).items.length; j++) {
    //     print("Item $j: " + dataBox.getAt(i).items[j].title);
    //   }
    update();
  }
}
