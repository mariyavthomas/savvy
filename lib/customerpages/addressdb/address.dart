import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 4)
class Address extends HiveObject {
  @HiveField(0)
  String  addname;
  @HiveField(1)
  String housename;
  @HiveField(2)
  String pincode;
  @HiveField(3)
  String post;
  @HiveField(4)
  String dis;
  @HiveField(5)
   int id;
    @HiveField(6)
   String number;
    @HiveField(7)
   String mail;
  Address(
      {required this.addname,
      required this.housename,
      required this.pincode,
      required this.post,
      required this.number,
      required this.mail,
      required this.dis,
      required this.id
      
      });
}
