
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/buy.dart';
import 'package:savvy/customerpages/pay.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:savvy/customerpages/user%20database/cart/cart.dart';
import 'package:savvy/customerpages/user%20database/cart/cartfunction.dart';
import 'package:savvy/customerpages/user%20database/cart/lastsucces.dart';
import 'package:savvy/customerpages/user%20database/cart/order.dart';
import 'package:savvy/customerpages/user%20database/cart/orderfunction.dart';

// ignore: must_be_immutable
class Paymentproduct extends StatelessWidget {
  Paymentproduct({
    required this.address,
   // super.key,
    Key?key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  }):super(key: key);
  Address? address;

  final bool? allow;
  final CartPaymentScreen widget;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\₹${widget.totelPrice}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: productlist,
              builder:
                  (BuildContext context, List<Product> productlist, Widget? child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () async {
                    if (groupValue == 'Now3') {
                      final cardDb = await Hive.openBox<Cart>('cart');
                
                      for (var i = 0; i < cardDb.length; i++) {
                        final data = productlist[i];
                        final order = OrderhistoryModel(
                            
                            pincode: address!.pincode,
                            usrname: address!.addname,
                            image: data.image,
                            productname: data.productname,
                            price: num.parse(data.price),
                            
                            quantity:data.quantity,);
                        orderhistoryy.addOrderHistory(order);
                      }
                      cardDb.clear();
                
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const success(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}