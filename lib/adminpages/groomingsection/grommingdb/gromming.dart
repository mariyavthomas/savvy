//import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'gromming.g.dart';

@HiveType(typeId: 3)
class Gromming extends HiveObject {
@HiveField(0)
 String  grommingname;
@HiveField(1)
 String functionality;
@HiveField(2)
 String  price;
@HiveField(3)
 String image;
@HiveField(4)
int ? id;
@HiveField(5)
String ?time;


Gromming({
 required this.time,
 required this.grommingname,
 required this.functionality,
 required this.price,
 required this.image, 
 required this.id
});


}
