
import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 11)
class Favorite extends HiveObject {

  @HiveField(0)
  String image;
  @HiveField(1)
  String productname;
  @HiveField(2)
  String price;
  
  @HiveField(3)
   String decripation;
   @HiveField(4)
   int id;

  Favorite(
      {
      required this.productname,
      required this.price,
      required this.image,
      
      required this.decripation, 
      required this.id});
}
