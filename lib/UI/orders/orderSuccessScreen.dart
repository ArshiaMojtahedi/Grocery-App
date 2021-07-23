import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/button.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 151,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 70),
              child: Image.asset(
                "assets/images/order_success_artwork.png",
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Your Order has been accepted",
                style: TextStyle(
                    fontSize: 24,
                    color: Appcolors().textColor1,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Your items has been placcd and is on it’s way to being processed",
                style: TextStyle(fontSize: 16, color: Appcolors().textColor2),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            AppRaiseButton(
              height: 60,
              width: 330,
              label: "Track Order",
              function: () => Get.back(),
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () => Get.offAndToNamed("/main"),
              child: Container(
                height: 44,
                width: 330,
                child: Center(
                  child: Text(
                    "Back To Home",
                    style: TextStyle(
                        fontSize: 16,
                        color: Appcolors().textColor1,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
