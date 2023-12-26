import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';


ValueNotifier<List<Bookgrom>>bookinglist=ValueNotifier([]);
String dbbook='dbbook';
class Grobook{

  Future<void> savebooking(Bookgrom value) async{
    final save = await Hive.openBox<Bookgrom>(dbbook);
    final id =await save.add(value);
    final data =save.get(id);
    await save.put(id, 
    Bookgrom(
      price: data!.price,
      dateTime: data.dateTime,
      age:data.age,
      imagePath: data.imagePath,
      grommingname: data.grommingname,
      aggressive: data.aggressive,
      breed: data.breed,
      gender: data.gender,
      id: id,
      //size: data.size,
      number:data.number,
      // grommingname: data.grommingname,
      // imagePath: data.imagePath
    ));
    getallbooking();
  }

  Future<void>getallbooking() async{
    final save=await Hive.openBox<Bookgrom>(dbbook);
    bookinglist.value.clear();
    bookinglist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    bookinglist.notifyListeners();
  }
  
  Future<void>deletebooking( context, int ?id)async{
    final remove=await Hive.openBox<Bookgrom>(dbbook);
    await remove.delete(id);
    getallbooking();
  }
}