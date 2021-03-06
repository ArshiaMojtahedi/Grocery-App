import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Controllers/favoriteController.dart';
import 'package:grocery_app/Controllers/productController.dart';
import 'package:grocery_app/UI/cart/widgets/cartItem.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Utils/tempData.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:grocery_app/Widgets/common/twoButtonAlertDialog.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/favoriteItem.dart';
import 'package:grocery_app/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartConroller cartConroller = Get.put(CartConroller());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  int id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Product product =
        TempData().products.singleWhere((element) => element.id.isEqual(id));

    return GetBuilder<ProductController>(
        init: ProductController(id: product.id),
        builder: (controller) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xffF4F4F4),
                appBar: AppBarLayout(
                  child: ProductDetailAppbar(),
                ),
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              product.image,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GetBuilder<FavoriteController>(
                                      builder: (controller2) {
                                    return InkWell(
                                      child: Image.asset(
                                          controller2.itemExist(product.id)
                                              ? "assets/images/heart_filled_icon.png"
                                              : "assets/images/heart_outline_icon.png",
                                          height: 24,
                                          color: Appcolors().green),
                                      onTap: () => controller2
                                              .itemExist(product.id)
                                          ? controller2.removeItem(product.id)
                                          : controller2.addItem(FavoriteItem(
                                              id: product.id,
                                              title: product.title,
                                              description: product.description,
                                              image: product.image,
                                              price: product.price)),
                                    );
                                  })
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                product.description,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Appcolors().textColor2),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Container(
                                          height: 40,
                                          width: 17,
                                          child: Image.asset(
                                            'assets/images/decrease_icon.png',
                                            width: 17,
                                          ),
                                        ),
                                        onTap: () =>
                                            controller.decreaseItem(product.id),
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
                                          controller.quantity.toString(),
                                          style: TextStyle(fontSize: 18),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        child: Container(
                                          width: 17,
                                          height: 40,
                                          child: Image.asset(
                                            'assets/images/increase_icon.png',
                                            width: 17,
                                          ),
                                        ),
                                        onTap: () =>
                                            controller.increaseItem(product.id),
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
                                height: 16,
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
                                product.detail ?? "No Detail",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Appcolors().textColor2),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomAppBar(
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: AppRaiseButton(
                      height: 60,
                      color: controller.itemExist(product.id)
                          ? (controller.quantityCartEqual(product.id)
                              ? Appcolors().red
                              : Appcolors().darkOrange)
                          : Appcolors().green,
                      label: controller.itemExist(product.id)
                          ? (controller.quantityCartEqual(product.id)
                              ? "Remove From Cart"
                              : "Change Quantity")
                          : "Add To Cart",
                      function: () {
                        if (controller.itemExist(product.id)) {
                          if (controller.quantityCartEqual(product.id)) {
                            Get.dialog(
                                TwoButtonAlertDialog(
                                  text:
                                      'Are you sure you want to delete this item from your cart?',
                                  yesFunction: () {
                                    String pName = controller.dataBox
                                        .get(product.id)
                                        .title;
                                    controller.removeItem(product.id);
                                    cartConroller.update();
                                    Get.back();
                                    Get.back();
                                    Get.snackbar("Item Removed",
                                        "$pName has been removed from your cart",
                                        colorText: Appcolors().red);
                                  },
                                  noFunction: () => Get.back(),
                                ),
                                barrierDismissible: false);
                          } else {
                            controller.changeItemQuantity(CartItem(
                              id: product.id,
                              title: product.title,
                              image: product.image,
                              price: product.price,
                              description: product.description,
                              amount: controller.quantity,
                            ));
                            cartConroller.update();
                            Get.back();
                            Get.snackbar("Quantity Changed",
                                "${controller.dataBox.get(product.id).title} quantity has been changed to ${controller.dataBox.get(product.id).amount.toString()}");
                          }
                        } else {
                          controller.addItem(CartItem(
                            id: product.id,
                            title: product.title,
                            image: product.image,
                            price: product.price,
                            description: product.description,
                            amount: controller.quantity,
                          ));
                          cartConroller.update();
                          Get.back();
                          Get.snackbar("Item added",
                              "${controller.dataBox.get(product.id).title} is now your cart!");
                        }
                      },
                    ),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          );
        });
  }
}
