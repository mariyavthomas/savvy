// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:savvy/customerpages/user%20database/cart/cart.dart';

ValueNotifier<List<Cart>> addcartlist = ValueNotifier([]);

Future<void> savecart(Cart value) async {
  final save = await Hive.openBox<Cart>('cart');
  final id = await save.add(value);
  final data = save.get(id);
  await save.put(id,
      Cart(name: data!.name, image: data.image, price: data.price, id: id, quantity:data.quantity,
      decripation: data.decripation
      ));
  getallcart();
}

Future<void> getallcart() async {
  final save = await Hive.openBox<Cart>('cart');
  addcartlist.value.clear();
  addcartlist.value.addAll(save.values);
  addcartlist.notifyListeners();
}

Future<void> deleteCart(int id) async {
  try {
    final box = await Hive.openBox<Cart>('cart');
    await box.delete(id);
    await box.close();  // Close the box after deleting
    getallcart();
  } catch (e) {
    print('Error deleting cart item: $e');
  }
}



Future<void>upgadecart(id,Cart value)async{
  final update=await Hive.openBox<Cart>('cart');
  
  if(update.containsKey(id)){
    await update.put(id, value);
    int index =addcartlist.value.indexWhere((element) => element.id==id);
    if(index!=-1){
      addcartlist.value[index]=value;
      addcartlist.notifyListeners();
    }
  }
value.id=id;
await update.put(id, value);
}