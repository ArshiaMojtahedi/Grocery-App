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
                  : Container();
            })),
      ),
    );
  }
}
