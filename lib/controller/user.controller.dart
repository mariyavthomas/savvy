
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/adminpages/database/product.dart';
//import 'package:savvy/adminpages/addproduct.dart';

ValueNotifier<List<Product>> productlist = ValueNotifier([]);
String dbname = 'dbname';

// ignore: unused_element

Future<void> save1(Product value) async {
  final save = await Hive.openBox<Product>(dbname);
  final id = await save.add(value);
  final data = save.get(id);
  await save.put(
      id,
      Product(
          productname: data!.productname,
          
          price: data.price,
        
          image: data.image,
          category: data.category,
          id: id,
          decripation: data.decripation,
          ));
  getall1();
}

Future<void> getall1() async {
  final save = await Hive.openBox<Product>(dbname);
  productlist.value.clear();
  productlist.value.addAll(save.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  productlist.notifyListeners();
}

Future<void> delete(int id) async {
  final remove = await Hive.openBox<Product>(dbname);
 await remove.delete(id);
  getall1();
}




   