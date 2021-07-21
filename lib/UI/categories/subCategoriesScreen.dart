import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Controllers/subCategoriesController.dart';
import 'package:grocery_app/UI/cart/widgets/cartItem.dart';
import 'package:grocery_app/UI/categories/widgets/subCategoryItem.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/searchBar.dart';
import 'package:grocery_app/models/subCategoryItem.dart';

class SubCategoriesScreen extends StatelessWidget {
  final SubCategoriesConreoller subCategoriesConreoller =
      Get.put(SubCategoriesConreoller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: SimpleAppBar(
              title: "Categories",
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  SearchBar(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: GetBuilder<SubCategoriesConreoller>(
                        builder: (controller) {
                      return ListView.separated(
                        separatorBuilder: (ctx, i) => SizedBox(
                          height: 8,
                        ),
                        padding: EdgeInsets.only(left: 16, right: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.subCategories.length,
                        itemBuilder: (ctx, i) => CategoryRowItem(
                          subCategory: controller.subCategories[i],
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
