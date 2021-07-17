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
                  SizedBox(
                    height: 16,
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.black12,
                  //   child: Icon(
                  //     Icons.home,
                  //     color: Appcolors().textColor3,
                  //   ),
                  // ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 30,
                  ),
                  SizedBox(
                    height: 8,
                  ),
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
                      Text(
                        "Home",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
