import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/cartItem.dart';

class ItemBox extends StatelessWidget {
  int id;
  String title;
  String description;
  int amount;
  double price;
  ItemBox({this.id, this.title, this.description, this.amount, this.price});

  final CartConroller cartConroller = Get.put(CartConroller());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 249,
          width: 173,
          padding: EdgeInsets.only(
            top: 24,
            left: 15,
            right: 15,
            bottom: 16,
          ),
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE2E2E2)),
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/temp/item1.png",
                  width: 100,
                  height: 80,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Appcolors().textColor2),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + price.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                      child: Image.asset(
                        "assets/images/add_to_cart_icon.png",
                        height: 45,
                      ),
                      onTap: () {
                        cartConroller.addItem(CartItem(
                            id: id,
                            title: title,
                            description: description,
                            amount: 1,
                            price: price));
                      })
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 27,
          child: GetBuilder<CartConroller>(builder: (controller) {
            return controller.dataBox.containsKey(id)
                ? Container(
                    height: 25,
                    width: 25,
                    child: Badge(
                      animationType: null,
                      badgeContent: Center(
                        child: Text(
                          controller.dataBox.getAt(id).amount.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      badgeColor: Colors.orange[900],
                    ),
                  )
                : Container();
          }),
        ),
      ],
    );
  }
}
