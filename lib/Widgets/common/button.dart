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
