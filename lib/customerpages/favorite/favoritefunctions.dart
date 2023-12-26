import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/customerpages/favorite/favorite.dart';


ValueNotifier<List<Favorite>> favoritelist = ValueNotifier([]);

// ignore: unused_element

Future<void> addfav(Favorite value) async {
  final save = await Hive.openBox<Favorite>('fav');
  final id = await save.add(value);
  final data = save.get(id);
  await save.put(
      id,
      Favorite(
          productname: data!.productname,
          
          price: data.price,
         
          image: data.image,
          id: id,
          
          decripation: data.decripation,
          ));
  getallfav();
}

Future<void> getallfav() async {
  final save = await Hive.openBox<Favorite>('fav');
  favoritelist.value.clear();
  favoritelist.value.addAll(save.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  favoritelist.notifyListeners();
}





   