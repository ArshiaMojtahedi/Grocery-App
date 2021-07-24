import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_app/UI/cart/cartScreen.dart';
import 'package:grocery_app/UI/categories/categoryDetailScreen.dart';
import 'package:grocery_app/UI/categories/subCategoriesScreen.dart';
import 'package:grocery_app/UI/main_screen/mainScreen.dart';
import 'package:grocery_app/UI/orders/orderDetailScreen.dart';
import 'package:grocery_app/UI/orders/orderSuccessScreen.dart';
import 'package:grocery_app/UI/product/productDetailScreen.dart';
import 'package:grocery_app/Utils/colors.dart';
import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/favoriteItem.dart';
import 'package:grocery_app/models/orderItem.dart';
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
  Hive.registerAdapter(FavoriteItemAdapter());
  Hive.registerAdapter(OrderItemAdapter());

  await Hive.openBox<CartItem>("cart");
  await Hive.openBox<FavoriteItem>("favorites");
  await Hive.openBox<OrderItem>("orders");

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

        //Categories
        GetPage(name: '/subCategories', page: () => (SubCategoriesScreen())),
        GetPage(name: '/category', page: () => (CategoryDetailScreen())),

        //Orders
        GetPage(name: '/orderSuccess', page: () => (OrderSuccessScreen())),
        GetPage(name: '/orderDetail', page: () => (OrderDetailScreen())),
      ],
    );
  }
}
