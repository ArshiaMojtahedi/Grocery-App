import 'package:flutter/material.dart';

class AppBarLayout extends PreferredSize {
  final Widget child;
  final double height;

  AppBarLayout({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: child,
        ),
      ],
    );
  }
}
