import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/product.dart';

class ItemBox extends StatelessWidget {
  int id;
  String title;
  String description;
  int amount;
  double price;
  String image;
  ItemBox(
      {this.id,
      this.title,
      this.description,
      this.amount,
      this.price,
      this.image});

  final CartConroller cartConroller = Get.put(CartConroller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/productDetail", arguments: id),
      child: Stack(
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
                    image,
                    width: 100,
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      child: RaisedButton(
                        elevation: 0,
                        child: Image.asset("assets/images/increase_icon.png",
                            color: Colors.white),
                        onPressed: () {
                          cartConroller.addItem(CartItem(
                              id: id,
                              title: title,
                              description: description,
                              amount: 1,
                              image: image,
                              price: price));
                        },
                        color: Appcolors().green,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(17.0)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GetBuilder<CartConroller>(builder: (controller) {
              return controller.dataBox.containsKey(id)
                  ? Container(
                      height: 25,
                      width: 25,
                      child: Badge(
                        animationType: null,
                        badgeContent: Center(
                          child: Text(
                            !controller.dataBox.containsKey(id)
                                ? ""
                                : controller.dataBox.get(id).amount.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        badgeColor: Appcolors().darkOrange,
                      ),
                    )
                  : Container();
            }),
          ),
        ],
      ),
    );
  }
}
