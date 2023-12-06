
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/customerpages/favorite/favorite.dart';

import 'favoritefunctions.dart';


void addfav_button(Product addproducts, BuildContext context) async {
  await Hive.openBox<Favorite>(dbname);
  final addfavBox = Hive.box<Favorite>(dbname);

  final favexists =
      addfavBox.values.any((user) => user.productname == addproducts.productname);
  if (favexists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final fav = Favorite(
        productname: addproducts.productname,
        price: addproducts.price,
        decripation: addproducts.decripation,
        id: -1,
        image: addproducts.image);
    addfav(fav);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favourite'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }
}

//delete wishlist

void deletefav(int id) async {
  final remove = await Hive.openBox<Favorite>(dbname);
  remove.delete(id);
  getallfav();
}