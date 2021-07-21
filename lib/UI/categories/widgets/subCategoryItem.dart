import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/categoryItem.dart';
import 'package:grocery_app/models/subCategoryItem.dart';

class CategoryRowItem extends StatelessWidget {
  SubCategory subCategory;
  CategoryRowItem({this.subCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/subCategories"),
      child: Container(
        width: 173,
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          // border: Border.all(
          //   width: 0.8,
          //   color: Color(
          //     int.parse("0xff" + subCategory.color),
          //   ),
          // ),
          color: Color(int.parse("0xff" + subCategory.color)).withOpacity(0.10),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Image.asset(
                subCategory.image,
                width: 71,
                height: 71,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Center(
              child: Text(
                subCategory.title,
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
