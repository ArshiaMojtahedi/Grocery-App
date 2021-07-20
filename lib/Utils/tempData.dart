import 'package:grocery_app/models/cartItem.dart';

class TempData {
  List<CartItem> items = [
    CartItem(
        id: 100,
        title: "Mowz",
        description: "1 Kg",
        amount: 1,
        price: 10,
        image: "assets/images/temp/item1.png"),
    CartItem(
        id: 101,
        title: "Gowje",
        description: "1 Kg",
        amount: 1,
        price: 2,
        image: "assets/images/temp/item2.png"),
    CartItem(
        id: 103,
        title: "Sib",
        description: "1 Kg",
        amount: 1,
        price: 3,
        image: "assets/images/temp/item3.png"),
    CartItem(
        id: 107,
        title: "Yomorta",
        description: "4pcs",
        amount: 1,
        price: 1.5,
        image: "assets/images/temp/item7.png"),
    CartItem(
        id: 104,
        title: "Nooshaba Coca",
        description: "350ml",
        amount: 1,
        price: 5,
        image: "assets/images/temp/item4.png"),
    CartItem(
        id: 105,
        title: "Nooshaba Pepsi",
        description: "350ml",
        amount: 1,
        price: 5,
        image: "assets/images/temp/item5.png")
  ];
}
