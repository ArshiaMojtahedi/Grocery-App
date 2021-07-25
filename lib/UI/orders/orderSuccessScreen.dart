import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/Widgets/common/button.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessScreen extends StatelessWidget {
  String id = Get.arguments;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/lottie/done.json',
              repeat: false,
              fit: BoxFit.fill,
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
                function: () {
                  Get.offNamed('/main');
                  Get.toNamed('/orderDetail', arguments: id);
                }),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () => Get.offNamed('/main'),
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
