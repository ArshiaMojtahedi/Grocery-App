import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Controllers/orderController.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:grocery_app/models/orderItem.dart';
import 'package:uuid/uuid.dart';

class AddOrderScreen extends StatelessWidget {
  placeOrder() {
    final OrderController orderController = Get.put(OrderController());
    final CartConroller cartConroller = Get.put(CartConroller());
    cartConroller.getItemList();
    OrderItem newOrder = OrderItem(
      id: Uuid().v1(),
      addressId: 1,
      paymentType: 1,
      promoCode: null,
      shippingType: 1,
      status: 0,
      total: cartConroller.getTotal(),
      items: cartConroller.getItemList(),
    );
    orderController.addOrder(newOrder);
    cartConroller.removeAll();
    orderController.getOrders();
    Get.offAndToNamed("/orderSuccess");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0), topLeft: Radius.circular(30.0)),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              TopBar(),
              SizedBox(
                height: 16,
              ),
              AddOrderRow(
                title: "Delivery",
                label: "Pick Up",
              ),
              AddOrderRow(
                title: "Payment",
                label: "Credit Card",
              ),
              AddOrderRow(
                title: "Promo Code",
                label: "Add Code",
              ),
              GetBuilder<CartConroller>(builder: (controller) {
                return AddOrderRow(
                  title: "Total Cost",
                  label: "\$" + controller.getTotal().toString(),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "By placing an order you agree to our Terms And Conditions",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppRaiseButton(
                  height: 67,
                  width: double.infinity,
                  label: "Place Order",
                  function: placeOrder,
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddOrderRow extends StatelessWidget {
  String title;
  String label;
  AddOrderRow({this.label, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Appcolors().textColor2),
              ),
              Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Appcolors().textColor1),
                  ),
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
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(left: 25, top: 25, bottom: 5, right: 25),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            Container(
              height: 22,
              width: 22,
              child: InkWell(
                child: Image.asset(
                  'assets/images/close_icon.png',
                  color: Appcolors().textColor1,
                ),
                onTap: () => Get.back(),
              ),
            ),
          ]),
        ),
        Divider(),
      ],
    );
  }
}
