import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Controllers/cartController.dart';
import 'package:grocery_app/Library/date_handeler.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:grocery_app/models/orderItem.dart';

class OrderRowItem extends StatelessWidget {
  OrderItem item;
  OrderRowItem({this.item});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartConroller>(builder: (controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 221,
                  child: Text(
                    "Order -#" + item.id,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 14,
                        color: Appcolors().textColor1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  dateConvert(item.dateCreated),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 12,
                      color: Appcolors().textColor2,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            StatusBox(),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/orderDetail', arguments: item.id),
              child: Center(
                child: Text(
                  "Show Details",
                  style: TextStyle(
                      color: Appcolors().green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      );
    });
  }
}

class StatusBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatusIcon(
              icon: 'assets/images/status_icon.png',
              title: "Ordered",
              textColor: Appcolors().textColor1,
            ),
            StatusLine(
              color: Appcolors().green,
            ),
            StatusIcon(
              icon: 'assets/images/status_inprogress_icon.png',
              title: "Ready To Ship",
              textColor: Appcolors().textColor2,
            ),
            StatusLine(),
            StatusIcon(
              icon: 'assets/images/status_icon.png',
              title: "Out For Delivery",
              textColor: Appcolors().textColor2,
              iconColor: Colors.black26,
            ),
            StatusLine(),
            StatusIcon(
              icon: 'assets/images/status_icon.png',
              title: "Delivered",
              textColor: Appcolors().textColor2,
              iconColor: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusLine extends StatelessWidget {
  Color color;
  StatusLine({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4),
      width: 25,
      child: Divider(
        thickness: 2,
        color: color,
      ),
    );
  }
}

class StatusIcon extends StatelessWidget {
  String title;
  String icon;
  Color textColor;
  Color iconColor;
  StatusIcon({this.icon, this.textColor, this.title, this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          color: iconColor,
          height: 24,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 51,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 11, color: textColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
