import 'package:hive/hive.dart';

part 'cartItem.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int amount;
  @HiveField(5)
  final String image;

  CartItem(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.amount,
      this.image});
}
