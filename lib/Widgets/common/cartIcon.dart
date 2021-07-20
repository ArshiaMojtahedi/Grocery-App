import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';

class CartIcon extends StatelessWidget {
  final CartConroller cartConroller = Get.put(CartConroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartConroller>(builder: (controller) {
      return Badge(
          // showBadge: false,
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            cartConroller.dataBox.length.toString(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          badgeColor: Colors.orange[900],
          padding: EdgeInsets.only(top: 7, right: 6, left: 6, bottom: 6),
          position: BadgePosition(bottom: 10, start: 18),
          child: GestureDetector(
            onTap: () => Get.toNamed("/cart"),
            child: Image.asset(
              "assets/images/tab_cart_off.png",
              height: 25,
            ),
          ));
    });
  }
}
