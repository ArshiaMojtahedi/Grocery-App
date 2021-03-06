import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/categoryItem.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/subCategories"),
      child: Container(
        width: 173,
        padding: EdgeInsets.only(
          top: 24,
          left: 15,
          right: 15,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.8,
            color: Color(
              int.parse("0xff" + category.color),
            ),
          ),
          color: Color(int.parse("0xff" + category.color)).withOpacity(0.10),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset(
                category.image,
                width: 100,
                height: 80,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                category.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
