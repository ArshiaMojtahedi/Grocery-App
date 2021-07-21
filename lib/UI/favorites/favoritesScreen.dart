import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/favoriteController.dart';
import 'package:grocery_app/UI/categories/widgets/categoryItem.dart';
import 'package:grocery_app/UI/favorites/widgets/favoritesItem.dart';

import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child:
                        GetBuilder<FavoriteController>(builder: (controller) {
                      return ListView.builder(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.dataBox.length,
                        itemBuilder: (ctx, i) => FavoritesRowItem(
                          id: controller.dataBox.getAt(i).id,
                          title: controller.dataBox.getAt(i).title,
                          description: controller.dataBox.getAt(i).description,
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
