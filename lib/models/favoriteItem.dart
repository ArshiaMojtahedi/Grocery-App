import 'package:hive/hive.dart';

part 'favoriteItem.g.dart';

@HiveType(typeId: 1)
class FavoriteItem extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;

  @HiveField(4)
  final String image;

  FavoriteItem({this.id, this.title, this.description, this.price, this.image});
}
