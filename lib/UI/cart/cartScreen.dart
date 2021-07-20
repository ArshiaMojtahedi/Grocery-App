import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/UI/cart/widgets/cartItem.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';

class CartScreen extends StatelessWidget {
  final CartConroller cartConroller = Get.put(CartConroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: CartAppBar(),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: GetBuilder<CartConroller>(builder: (controller) {
                      return ListView.builder(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.dataBox.length,
                        itemBuilder: (ctx, i) => CartRowItem(
                          id: controller.dataBox.getAt(i).id,
                          title: controller.dataBox.getAt(i).title,
                          description: controller.dataBox.getAt(i).description,
                          amount: controller.dataBox.getAt(i).amount,
                          price: controller.dataBox.getAt(i).price,
                          image: controller.dataBox.getAt(i).image,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
