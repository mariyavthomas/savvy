import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/category/categoty.dart';

ValueNotifier<List<Category1>> categorylist = ValueNotifier([]);
String dbcate = 'cate';

class CategoryHelper {
  Future<void> save(Category1 value) async {
    final save = await Hive.openBox<Category1>(dbcate);
    final id = await save.add(value);
    final data = save.get(id);
    await save.put(
        id,
        Category1(
            categoryname: data!.categoryname,
            catimage: data.catimage,
            id: id));
            getallcategory();
  }

  Future<void>getallcategory()async{
    final save=await Hive.openBox<Category1>(dbcate);
    categorylist.value.clear();
    categorylist.value.addAll(save.values);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    categorylist.notifyListeners();
  }
  Future<void> delete(int id) async {
  final remove = await Hive.openBox<Category1>(dbcate);
   await remove.delete(id);
  getallcategory();
}
}
