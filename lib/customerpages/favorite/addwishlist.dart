// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/customerpages/favorite/favorite.dart';
import 'package:savvy/customerpages/favorite/favoritefunctions.dart';



Future<void> addfav_button(
  Product product,
  BuildContext context,
  int count,
) async {
  await Hive.openBox<Favorite>('fav');
  final addfavBox = Hive.box<Favorite>('fav');

  final favexists =
      addfavBox.values.any((user) => user.productname == product.productname);
  if (favexists) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Product Alredy Exist!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  } else {
    final fav = Favorite(
        productname: product.productname,
        price: product.price,
        decripation: product.decripation,
        image: product.image,
        id: -1);
    addfav(fav);
    

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Added to Favourite'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ));
  }
}

void removefav(BuildContext context, int? id) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Remove Fav'),
          content: Text('Do you want to remove'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  deletefav(context, id);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}

//delete wishlist

Future<void> deletefav(context, int? id) async {
  final remove = await Hive.openBox<Favorite>('fav');
  remove.delete(id);
 
  getallfav();

  // Navigator.of(context)
  //     .pop(MaterialPageRoute(builder: (context) => Favourite()));
}

Icon getIcon(Product product) {
  final addfavBox = Hive.box<Favorite>('fav');
  final favexists =
      addfavBox.values.any((user) => user.productname == product.productname);

  if (favexists) {
    return Icon(
      Icons.favorite,
      color: Colors.red,

    );
  } else {
    return Icon(
      Icons.favorite_border,
      color: Colors.black,
    );
  }
}