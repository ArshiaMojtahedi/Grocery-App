import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/favoriteController.dart';
import 'package:grocery_app/Controllers/orderController.dart';
import 'package:grocery_app/UI/favorites/widgets/favoritesItem.dart';
import 'package:grocery_app/UI/orders/widgets/orderItem.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';

class OrdersScreen extends StatelessWidget {
  final OrderController favoriteController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBarLayout(
              child: MainAppbar(
                title: "Orders",
              ),
            ),
            body: GetBuilder<OrderController>(builder: (controller) {
              return controller.dataBox.length != 0
                  ? Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: ListView.separated(
                                separatorBuilder: (ctx, i) => Divider(),
                                padding: EdgeInsets.only(left: 16, right: 16),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.dataBox.length,
                                itemBuilder: (ctx, i) => OrderRowItem(
                                    item: controller.dataBox.getAt(i)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : EmptyOrderContainer();
            })),
      ),
    );
  }
}

class EmptyOrderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 70, right: 70),
            child: Image.asset(
              "assets/images/tab_orders_off.png",
              color: Colors.black12,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "No Orders",
            style: TextStyle(
                fontSize: 24,
                color: Appcolors().textColor2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "After you place an order it will appear here",
            style: TextStyle(fontSize: 16, color: Appcolors().textColor2),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
