import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/UI/cart/widgets/cartItem.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:grocery_app/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartConroller cartConroller = Get.put(CartConroller());
  Product product = Product(
    id: 101,
    title: "Mowz",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF4F4F4),
          appBar: AppBarLayout(
            child: ProductDetailAppbar(),
          ),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/temp/item1.png",
                      width: 330,
                      height: 200,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(24),
                  color: Color(0xffF4F4F4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mowz",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/images/heart_outline_icon.png",
                            height: 24,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "1 Kg",
                        style: TextStyle(
                            fontSize: 16, color: Appcolors().textColor2),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/decrease_icon.png',
                                width: 17,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xffE2E2E2),
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  "1",
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/images/increase_icon.png',
                                width: 17,
                              )
                            ],
                          ),
                          Text(
                            "\$" + "25",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Product Detail",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                        style: TextStyle(
                            fontSize: 13, color: Appcolors().textColor2),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16),
              child: AppRaiseButton(
                height: 60,
                label: "Add To Cart",
                function: () {},
              ),
            ),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
