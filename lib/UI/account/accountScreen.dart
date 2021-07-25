import 'package:flutter/material.dart';
import 'package:grocery_app/Widgets/common/appbar.dart';
import 'package:grocery_app/Widgets/common/appbarLayout.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
              child: MainAppbar(
            title: "Acccount",
          )),
          body: Container(
            child: Text("dasda"),
          ),
        ),
      ),
    );
  }
}
