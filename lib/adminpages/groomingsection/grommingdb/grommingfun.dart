import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:savvy/adminpages/addproduct.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';

ValueNotifier<List<Gromming>>gromminglist=ValueNotifier([]);
String dbgroom='dbgroom';
class GroHelper{

  Future<void> save(Gromming value) async{
    final save = await Hive.openBox<Gromming>(dbgroom);
    final id =await save.add(value);
    final data =save.get(id);
    await save.put(id, 
    Gromming(
      grommingname: data!.grommingname,
      price: data.price,
      functionality: data.functionality,
      image: data.image,
      id: data.id,
      time: data.time,
    ));
    getall2();
  }

  Future<void>getall2() async{
    final save=await Hive.openBox<Gromming>(dbgroom);
    gromminglist.value.clear();
    gromminglist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    gromminglist.notifyListeners();
  }
  
  Future<void>delete(int id)async{
    final remove=await Hive.openBox(dbgroom);
    await remove.delete(id);
    getall2();
  }
}