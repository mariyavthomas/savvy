
import 'package:hive/hive.dart';

part 'grrombook.g.dart';

@HiveType(typeId: 16)
class Bookgrom extends HiveObject {

  @HiveField(0)
  String breed;
  @HiveField(1)
  String gender;
  
  
  @HiveField(2)
   String aggressive;
   @HiveField(3)
  
   int id;
    @HiveField(4)
    String age;
  @HiveField(5)
  String dateTime;
  @HiveField(6)
  String number;
  @HiveField(7)
   String imagePath;
   @HiveField(8)
   String grommingname;
   @HiveField(9)
   String price;
  Bookgrom(
      {
        required this.imagePath,
        required this.number,
        required this.grommingname,
        required this.id,
      required this.breed,
      required this.age,
required this.price,
      required this.aggressive,
      
      required this.gender, 
      //required this.size,
      required this.dateTime, 
      
        });
}
