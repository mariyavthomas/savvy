import 'package:hive_flutter/hive_flutter.dart';

part 'cart.g.dart';

@HiveType(typeId: 10)
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
  // @HiveField(5)
  // String decripation;

  Cart(
      {required this.name,
      required this.image,
      required this.price,
      // required this.decripation,
     required this.id,
     required this.quantity
      });
}
