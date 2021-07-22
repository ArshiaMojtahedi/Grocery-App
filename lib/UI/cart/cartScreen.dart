import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/UI/cart/widgets/cartItem.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/button.dart';

class CartScreen extends StatelessWidget {
  final CartConroller cartConroller = Get.put(CartConroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartConroller>(builder: (controller) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBarLayout(
              child: CartAppBar(),
            ),
            body: controller.dataBox.length != 0
                ? Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.dataBox.length,
                              itemBuilder: (ctx, i) => CartRowItem(
                                id: controller.dataBox.getAt(i).id,
                                title: controller.dataBox.getAt(i).title,
                                description:
                                    controller.dataBox.getAt(i).description,
                                amount: controller.dataBox.getAt(i).amount,
                                price: controller.dataBox.getAt(i).price,
                                image: controller.dataBox.getAt(i).image,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : EmptyCartContainer(),
            bottomNavigationBar: controller.dataBox.length != 0
                ? BottomAppBar(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: CheckoutButton(
                          height: 60,
                          label: "Proceed To Chekout",
                          total: controller.getTotal().toString(),
                          function: () {}),
                    ),
                    elevation: 0,
                  )
                : Container(
                    height: 1,
                  ),
          ),
        ),
      );
    });
  }
}

class EmptyCartContainer extends StatelessWidget {
  const EmptyCartContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 70),
            child: Image.asset(
              "assets/images/tab_cart_off.png",
              color: Colors.black12,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Your cart is empty",
            style: TextStyle(
                fontSize: 24,
                color: Appcolors().textColor2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "You can browse out shop and add items to your shopping cart.",
              style: TextStyle(fontSize: 16, color: Appcolors().textColor2),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          AppRaiseButton(
            height: 60,
            width: 330,
            label: "Start Shopping",
            function: () => Get.back(),
          )
        ],
      ),
    );
  }
}
