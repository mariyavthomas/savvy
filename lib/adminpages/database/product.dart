import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product extends HiveObject {
  // @HiveField(0)
  // final String? email;
  // @HiveField(1)
  // final String? password;
  // @HiveField(2)
  // final String? name;
  // @HiveField(3)
  // final String? number;
  @HiveField(0)
  String image;
  @HiveField(1)
  String productname;
  @HiveField(2)
  String price;
  @HiveField(3)
  int? id;
  @HiveField(4)
   String decripation;
   @HiveField(5)
   String category;
  //  @HiveField(6)
  //  String quantity;

  Product(
      {required this.id,
      required this.productname,
      required this.price,
      required this.image,
      required this.category,
      required this.decripation, 
      
      });

  get quantity => null;
}
