import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Utils/tempData.dart';
import 'package:grocery_app/Widgets/common/ItemBox.dart';

class HorizentalItemList extends StatelessWidget {
  String title;

  HorizentalItemList({this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                "See all",
                style: TextStyle(fontSize: 16, color: Appcolors().green),
              ),
            ],
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
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
    );
  }
}
