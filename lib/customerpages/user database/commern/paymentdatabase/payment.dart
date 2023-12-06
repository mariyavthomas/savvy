import 'package:hive_flutter/hive_flutter.dart';

part 'payment.g.dart';

@HiveType(typeId: 12)
class Cart extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String price;

  @HiveField(2)
  String? image;

  @HiveField(3)
  int? id;
  @HiveField(4)
  double quantity;
  @HiveField(5)
  String paymentMethod;

  Cart(
      {required this.name,
      required this.image,
      required this.price,
     required this.paymentMethod,
     required this.id,
     required this.quantity
      });
}
