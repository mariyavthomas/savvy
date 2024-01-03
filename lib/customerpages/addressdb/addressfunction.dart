import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
// ignore: unused_import
import 'package:savvy/adminpages/addproduct.dart';
import 'package:savvy/customerpages/addressdb/address.dart';

ValueNotifier<List<Address>> addresslist = ValueNotifier([]);

String dbadress = 'address';

class AddressHel {
  Future<void> save(Address value) async {
    final save = await Hive.openBox<Address>(dbadress);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
        id,
        Address(
            addname: data!.addname,
            housename: data.housename,
            pincode: data.pincode,
            post: data.post,
            mail: data.mail,
            number: data.number,
            dis: data.dis,
            id: id
            ));
    getalll();
  }

  Future<void> getalll() async {
    final save = await Hive.openBox<Address>(dbadress);
    addresslist.value.clear();
    addresslist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    addresslist.notifyListeners();
  }

  Future<void> delete1(context, int ?id) async {
    final remove = await Hive.openBox<Address>(dbadress);
    remove.delete(id);
    getalll();
  }
}
