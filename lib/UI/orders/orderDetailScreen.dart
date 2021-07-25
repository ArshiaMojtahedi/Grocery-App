import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grocery_app/Controllers/orderDetailController.dart';
import 'package:grocery_app/Library/date_handeler.dart';
import 'package:grocery_app/UI/orders/widgets/orderDetailItem.dart';

import 'package:grocery_app/UI/orders/widgets/orderItem.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';

class OrderDetailScreen extends StatelessWidget {
  String id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
        init: OrderDetailController(id: id),
        builder: (controller) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                  appBar: AppBarLayout(
                    child: SimpleAppBar(
                      title: "Order Details",
                    ),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(24),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order -#" + controller.item.id,
                            style: TextStyle(
                                fontSize: 14,
                                color: Appcolors().textColor3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          // StatusBox(),
                          StatusTextRow(
                            label: "Status: ",
                            text: "Ready To Ship",
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          StatusTextRow(
                            label: "Date: ",
                            text: dateConvert(controller.item.dateCreated),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          StatusTextRow(
                            label: "Address: ",
                            text: "Filan Street, Filan Blv, No 2.",
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          StatusTextRow(
                            label: "Payment Type: ",
                            text: "Credit Card",
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          StatusTextRow(
                            label: "Total Price: ",
                            text: "\$" + controller.item.total.toString(),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Divider(
                            thickness: 1.2,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Items",
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          ListView.separated(
                            separatorBuilder: (ctx, i) => Column(
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                              ],
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.item.items.length,
                            itemBuilder: (ctx, i) => OrderDetailItem(
                              id: controller.item.items[i].id,
                              image: controller.item.items[i].image,
                              price: controller.item.items[i].price *
                                  controller.item.items[i].amount,
                              title:
                                  controller.item.items[i].amount.toString() +
                                      "x " +
                                      controller.item.items[i].title,
                              description: controller.item.items[i].description,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}

class StatusTextRow extends StatelessWidget {
  String label;
  String text;
  StatusTextRow({this.label, this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 14,
              color: Appcolors().textColor2,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: Appcolors().textColor1,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
