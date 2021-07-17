import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/UI/main_screen/mainScreen.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sound Of Good Music',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Gilroy"),
      ),
      home: MainScreen(),
      getPages: [
        //Main
        GetPage(name: '/main', page: () => (MainScreen())),
      ],
    );
  }
}
