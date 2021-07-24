import 'package:grocery_app/models/cartItem.dart';
import 'package:hive/hive.dart';

part 'orderItem.g.dart';

@HiveType(typeId: 2)
class OrderItem extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final int addressId;
  @HiveField(3)
  final List<CartItem> items;
  @HiveField(4)
  final double total;
  @HiveField(5)
  final int shippingType;
  @HiveField(6)
  final String promoCode;
  @HiveField(7)
  final int paymentType;
  @HiveField(8)
  final int status;
  @HiveField(9)
  final DateTime dateCreated;

  OrderItem(
      {this.id,
      this.userId,
      this.addressId,
      this.items,
      this.total,
      this.shippingType,
      this.promoCode,
      this.paymentType,
      this.dateCreated,
      this.status});
}
