import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Utils/colors.dart';

class CartRowItem extends StatelessWidget {
  int id;
  String title;
  String description;
  int amount;
  double price;
  String image;
  CartRowItem(
      {this.id,
      this.title,
      this.description,
      this.amount,
      this.price,
      this.image});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartConroller>(builder: (controller) {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed("/productDetail", arguments: id),
                      child: Image.asset(
                        image,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 12, color: Appcolors().textColor2),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              child: OutlineButton(
                                  child: Image.asset(
                                      "assets/images/decrease_icon.png"),
                                  onPressed: () => controller.decreaseItem(id),
                                  color: Colors.black,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(17.0))),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              child: Text(
                                amount.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Appcolors().textColor2),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              child: OutlineButton(
                                child: Image.asset(
                                    "assets/images/increase_icon.png"),
                                onPressed: () => controller.increaseItem(id),
                                color: Colors.black,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(17.0)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // SizedBox(
                    //   width: 32,
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "assets/images/close_icon.png",
                        height: 14,
                      ),
                      onTap: () => controller.removeItem(id),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text("\$" + (amount * price).toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    });
  }
}
