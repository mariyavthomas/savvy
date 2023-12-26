import 'package:hive_flutter/adapters.dart';
part 'order.g.dart';

@HiveType(typeId: 12)
class OrderhistoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String productname;
  @HiveField(3)
  num price;

  // @HiveField(4)
  // String category;

  @HiveField(4)
  double? quantity;

  @HiveField(5)
  String? pincode;

  // @HiveField(7)
  // String? number;

  @HiveField(6)
  String? usrname;

  OrderhistoryModel(
      {
     // required this.number,
      required this.pincode,
      required this.usrname,
      required this.image,
      required this.productname,
      required this.price,
      this.id,
      required this.quantity,
      //required this.category
      });
}
