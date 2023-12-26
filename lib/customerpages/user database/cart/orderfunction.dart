import 'package:savvy/customerpages/user%20database/cart/order.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<OrderhistoryModel>> orderhistoryNotify = ValueNotifier([]);
OrderHistory orderhistoryy = OrderHistory();

class OrderHistory extends ChangeNotifier {
  void addOrderHistory(OrderhistoryModel value) async {
    final orderDB = await Hive.openBox<OrderhistoryModel>('order_history_db');
    final id = await orderDB.add(value);
    value.id = id;
    final orderhistory = orderDB.get(id);
    await orderDB.put(
      id,
      OrderhistoryModel(
          
        //  number: orderhistory?.number,
          image: orderhistory!.image,
          pincode: orderhistory.pincode,
          usrname: orderhistory.usrname,
          productname: orderhistory.productname,
          price: orderhistory.price,
        //  category: orderhistory.category,
          quantity: orderhistory.quantity
          ),
    );
    orderhistoryNotify.value.add(orderhistory);
    orderhistoryNotify.notifyListeners();
  }

  getAllOrders() async {
    final orderDB = await Hive.openBox<OrderhistoryModel>('order_history_db');
    orderhistoryNotify.value.clear();
    orderhistoryNotify.value.addAll(orderDB.values);
    orderhistoryNotify.notifyListeners();
  }

  Future<void> delete(int id) async {
    final remove = await Hive.openBox<OrderhistoryModel>('order_history_db');
    remove.delete(id);
    getAllOrders();
  }
}