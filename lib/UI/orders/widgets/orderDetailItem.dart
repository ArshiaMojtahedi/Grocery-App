import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Controllers/orderController.dart';
import 'package:grocery_app/Utils/colors.dart';

class OrderDetailItem extends StatelessWidget {
  int id;
  String title;
  String description;
  double price;
  String image;
  OrderDetailItem(
      {this.id, this.title, this.description, this.price, this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/productDetail", arguments: id),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      height: 70,
                      width: 70,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 14, color: Appcolors().textColor2),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 32,
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Text("\$" + price.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      "assets/images/right_arrow_icon.png",
                      height: 14,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
