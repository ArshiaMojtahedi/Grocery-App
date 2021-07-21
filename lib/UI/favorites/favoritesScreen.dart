import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/favoriteController.dart';
import 'package:grocery_app/UI/categories/widgets/categoryItem.dart';
import 'package:grocery_app/UI/favorites/widgets/favoritesItem.dart';
import 'package:grocery_app/Utils/colors.dart';

import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:grocery_app/Widgets/common/searchBar.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
            appBar: AppBarLayout(
              child: MainAppbar(
                title: "Favorites",
              ),
            ),
            body: GetBuilder<FavoriteController>(builder: (controller) {
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
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.dataBox.length,
                                itemBuilder: (ctx, i) => FavoritesRowItem(
                                  id: controller.dataBox.getAt(i).id,
                                  title: controller.dataBox.getAt(i).title,
                                  description:
                                      controller.dataBox.getAt(i).description,
                                  price: controller.dataBox.getAt(i).price,
                                  image: controller.dataBox.getAt(i).image,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : EmptyFavoritesContainer();
            })),
      ),
    );
  }
}

class EmptyFavoritesContainer extends StatelessWidget {
  const EmptyFavoritesContainer({
    Key key,
  }) : super(key: key);

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
              "assets/images/heart_filled_icon.png",
              color: Colors.black12,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "No Favorites",
            style: TextStyle(
                fontSize: 24,
                color: Appcolors().textColor2,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "You can add your favorite products to the list by taping the heart icon in the product page.",
            style: TextStyle(fontSize: 16, color: Appcolors().textColor2),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
