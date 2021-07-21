import 'package:grocery_app/models/cartItem.dart';
import 'package:grocery_app/models/categoryItem.dart';
import 'package:grocery_app/models/product.dart';
import 'package:grocery_app/models/subCategoryItem.dart';

class TempData {
  List<CartItem> items = [
    CartItem(
        id: 100,
        title: "Mowz",
        description: "1 Kg",
        amount: 1,
        price: 10,
        image: "assets/images/temp/item1.png"),
    CartItem(
        id: 101,
        title: "Gowje",
        description: "1 Kg",
        amount: 1,
        price: 2,
        image: "assets/images/temp/item2.png"),
    CartItem(
        id: 103,
        title: "Sib",
        description: "1 Kg",
        amount: 1,
        price: 3,
        image: "assets/images/temp/item3.png"),
    CartItem(
        id: 107,
        title: "Yomorta",
        description: "4 pcs",
        amount: 1,
        price: 1.5,
        image: "assets/images/temp/item7.png"),
    CartItem(
        id: 104,
        title: "Nooshaba Coca",
        description: "350 ml",
        amount: 1,
        price: 5,
        image: "assets/images/temp/item4.png"),
    CartItem(
        id: 105,
        title: "Nooshaba Pepsi",
        description: "350 ml",
        amount: 1,
        price: 5,
        image: "assets/images/temp/item5.png")
  ];

  List<Product> products = [
    Product(
        id: 100,
        title: "Mowz",
        description: "1 Kg",
        price: 10,
        detail:
            "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
        image: "assets/images/temp/item1.png"),
    Product(
        id: 101,
        title: "Gowje",
        description: "1 Kg",
        price: 2,
        detail:
            "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
        image: "assets/images/temp/item2.png"),
    Product(
        id: 103,
        title: "Sib",
        description: "1 Kg",
        price: 3,
        image: "assets/images/temp/item3.png"),
    Product(
        id: 107,
        title: "Yomorta",
        description: "4 pcs",
        price: 1.5,
        image: "assets/images/temp/item7.png"),
    Product(
        id: 104,
        title: "Nooshaba Coca",
        description: "350 ml",
        price: 5,
        image: "assets/images/temp/item4.png"),
    Product(
        id: 105,
        title: "Nooshaba Pepsi",
        description: "350 ml",
        price: 5,
        image: "assets/images/temp/item5.png")
  ];

  List<Category> categories = [
    Category(
      id: 1,
      title: "Frash Fruits \& Vegetable",
      color: "53B175",
      image: "assets/images/temp/category2.png",
    ),
    Category(
      id: 2,
      title: "Cooking Oil \& Ghee",
      color: "F8A44C",
      image: "assets/images/temp/category3.png",
    ),
    Category(
      id: 3,
      title: "Meat \& Fish",
      color: "F7A593",
      image: "assets/images/temp/category4.png",
    ),
    Category(
      id: 4,
      title: "Bakery \& Snacks",
      color: "D3B0E0",
      image: "assets/images/temp/category1.png",
    ),
    Category(
      id: 5,
      title: "Diary \& Eggs",
      color: "FDE598",
      image: "assets/images/temp/category5.png",
    ),
    Category(
      id: 5,
      title: "Beverages",
      color: "B7DFF5",
      image: "assets/images/temp/category6.png",
    ),
  ];

  List<SubCategory> subCategories = [
    SubCategory(
      id: 1,
      title: "Frash Fruits \& Vegetable",
      color: "53B175",
      image: "assets/images/temp/category2.png",
    ),
    SubCategory(
      id: 2,
      title: "Cooking Oil \& Ghee",
      color: "F8A44C",
      image: "assets/images/temp/category3.png",
    ),
    SubCategory(
      id: 3,
      title: "Meat \& Fish",
      color: "F7A593",
      image: "assets/images/temp/category4.png",
    ),
    SubCategory(
      id: 4,
      title: "Bakery \& Snacks",
      color: "D3B0E0",
      image: "assets/images/temp/category1.png",
    ),
    SubCategory(
      id: 5,
      title: "Diary \& Eggs",
      color: "FDE598",
      image: "assets/images/temp/category5.png",
    ),
    SubCategory(
      id: 5,
      title: "Beverages",
      color: "B7DFF5",
      image: "assets/images/temp/category6.png",
    ),
  ];
}
