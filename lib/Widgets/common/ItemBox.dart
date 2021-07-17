import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/colors.dart';

class ItemBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      width: 173,
      padding: EdgeInsets.only(
        top: 24,
        left: 15,
        right: 15,
        bottom: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2E2E2)),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Image.asset(
              "assets/images/temp/item1.png",
              width: 100,
              height: 80,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Organic Bananas",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "1 Kg",
            style: TextStyle(fontSize: 12, color: Appcolors().textColor2),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$4.99",
                style: TextStyle(fontSize: 16),
              ),
              Image.asset(
                "assets/images/add_to_cart_icon.png",
                height: 45,
              )
            ],
          )
        ],
      ),
    );
  }
}
