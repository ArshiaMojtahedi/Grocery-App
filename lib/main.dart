import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/UI/cart/cartScreen.dart';
import 'package:grocery_app/UI/main_screen/mainScreen.dart';
import 'package:grocery_app/UI/product/productDetailScreen.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Appcolors().green,
  ));
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>("cart");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Gilroy"),
      ),
      home: MainScreen(),
      getPages: [
        //Main
        GetPage(name: '/main', page: () => (MainScreen())),

        //Cart
        GetPage(name: '/cart', page: () => (CartScreen())),

        //Product
        GetPage(name: '/productDetail', page: () => (ProductDetailScreen())),
      ],
    );
  }
}
