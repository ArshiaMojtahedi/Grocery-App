import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/colors.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173,
      padding: EdgeInsets.only(
        top: 24,
        left: 15,
        right: 15,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD3B0E0)),
        color: Color(0xffD3B0E0).withOpacity(0.25),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Image.asset(
              "assets/images/temp/category1.png",
              width: 100,
              height: 80,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Fresh Vegetables and kooft",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
