import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/UI/categories/widgets/categoryItem.dart';
import 'package:grocery_app/UI/home/widgets/horizentalItemList.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Utils/tempData.dart';
import 'package:grocery_app/Widgets/common/ItemBox.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/searchBar.dart';
import 'package:grocery_app/models/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: MainAppbar(
              title: "Categories",
            ),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                SearchBar(),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: GridView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: (5 / 6),
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12),
                              itemCount: TempData().categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoryItem(
                                    category: TempData().categories[index]);
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
