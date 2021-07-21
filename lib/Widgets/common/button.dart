import 'package:flutter/material.dart';
import 'package:grocery_app/Utils/colors.dart';

class AppRaiseButton extends StatelessWidget {
  VoidCallback function;
  String label;
  double height;
  double width;
  Color color;

  AppRaiseButton(
      {this.function, this.label, this.height, this.width, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: 0,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: function,
        color: color ?? Appcolors().green,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0)),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  VoidCallback function;
  String label;
  double height;
  double width;
  Color color;
  String total;

  CheckoutButton(
      {this.function,
      this.label,
      this.height,
      this.width,
      this.color,
      this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff489E67),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Text(
                "\$" + total,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        onPressed: function,
        color: color ?? Appcolors().green,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18)),
      ),
    );
  }
}
