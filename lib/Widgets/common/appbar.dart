import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25,
          ),
          Text(
            "Categories",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          Badge(
            // showBadge: false,
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "10",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            badgeColor: Colors.orange[900],
            padding: EdgeInsets.only(top: 7, right: 6, left: 6, bottom: 6),
            position: BadgePosition(bottom: 10, start: 18),
            child: Image.asset(
              "assets/images/tab_cart_off.png",
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}
