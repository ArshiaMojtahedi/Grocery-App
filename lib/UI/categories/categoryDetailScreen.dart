import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/UI/categories/widgets/categoryItem.dart';
import 'package:grocery_app/UI/home/widgets/horizentalItemList.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Utils/tempData.dart';
import 'package:grocery_app/Widgets/common/ItemBox.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';
import 'package:grocery_app/Widgets/common/searchBar.dart';
import 'package:grocery_app/models/categoryItem.dart';

class CategoryDetailScreen extends StatelessWidget {
  String title = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
            child: SimpleAppBar(
              title: title,
            ),
          ),
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    children: [
                      Expanded(child: SearchBar()),
                      Image.asset(
                        "assets/images/filter_icon.png",
                        height: 17,
                      )
                    ],
                  ),
                ),
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
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: (7 / 10),
                            ),
                            itemCount: TempData().items.length,
                            itemBuilder: (ctx, i) => ItemBox(
                              title: TempData().items[i].title,
                              description: TempData().items[i].description,
                              price: TempData().items[i].price,
                              amount: TempData().items[i].amount,
                              id: TempData().items[i].id,
                              image: TempData().items[i].image,
                            ),
                          ),
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
