

import 'package:hive/hive.dart';

part 'categoty.g.dart';
@HiveType(typeId:15)
class  Category1 {
   @HiveField(0)
   String catimage;
   @HiveField(1)
   String categoryname;
   @HiveField(2)
   int  id;
   Category1({
    required this.catimage,required this.categoryname,  required this.id
   });
}