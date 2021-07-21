import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartIcon.dart';

class SimpleAppBar extends StatelessWidget {
  String title;
  SimpleAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: Image.asset(
                      "assets/images/back_arrow_icon.png",
                      height: 20,
                    ),
                    onPressed: () => Get.back()),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              Badge(
                // showBadge: false,
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  "10",
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
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}

class MainAppbar extends StatelessWidget {
  String title;
  MainAppbar({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          CartIcon(),
        ],
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                // height: 30,
                width: 25,
              ),
              SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "Havij",
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.orange[900],
                  ),
                ),
              ),
            ],
          ),
          CartIcon(),
        ],
      ),
    );
  }
}

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 8,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: Image.asset(
                      "assets/images/back_arrow_icon.png",
                      height: 20,
                    ),
                    onPressed: () => Get.back()),
              ),
              Text(
                "My Cart",
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}

class ProductDetailAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24),
      color: Colors.white,
      width: double.infinity,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 25,
        child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            icon: Image.asset(
              "assets/images/back_arrow_icon.png",
              height: 20,
            ),
            onPressed: () => Get.back()),
      ),
    );
  }
}
