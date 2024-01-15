import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';
//import 'package:savvy/adminpages/addproduct.dart';


ValueNotifier<List<User>>userlist=ValueNotifier([]);
String users='users';

class Userfunction {
  Future<void> save3(User value) async{
    final save = await Hive.openBox<User>(users);
    final email =await save.add(value);
    final data =save.get(email);
    await save.put(email, 
    User(
      name: data!.name,
      email: data.email,
     password: data.password,
     number: data.number,
    image: data.image,
     id: data.id
    ));
    getall3();
  }

  Future<void>getall3() async{
    final save=await Hive.openBox<User>('users');
    userlist.value.clear();
    userlist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    userlist.notifyListeners();
  }
  
 
}