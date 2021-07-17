import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/UI/home/widgets/horizentalItemList.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/searchBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              // height: 30,
                              width: 25,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "Havij",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ),
                          ],
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
                          padding: EdgeInsets.only(
                              top: 7, right: 6, left: 6, bottom: 6),
                          position: BadgePosition(bottom: 10, start: 18),
                          child: Image.asset(
                            "assets/images/tab_cart_off.png",
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CircleAvatar(
                  //   backgroundColor: Colors.black12,
                  //   child: Icon(
                  //     Icons.home,
                  //     color: Appcolors().textColor3,
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 8,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/location_icon.png",
                        height: 15,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "Amjadieh, Bahar",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Change Address",
                    style: TextStyle(fontSize: 12, color: Appcolors().green),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SearchBar(),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      "assets/images/temp/banner.png",
                      height: 115,
                      width: 368,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  HorizentalItemList(
                    title: "Exclusive Offer",
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  HorizentalItemList(
                    title: "Best Selling",
                  ),
                  SizedBox(
                    height: 32,
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
