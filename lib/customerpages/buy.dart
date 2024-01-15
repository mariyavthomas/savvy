// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';

import 'user database/cart/bottamcart.dart';
import 'user database/cart/cart.dart';
import 'user database/cart/cartfunction.dart';

class CartPaymentScreen extends StatefulWidget {
  final double totels;
  final address;

  CartPaymentScreen({
    required this.address,
    required this.totels,
  });

  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  String groupValue = 'Now3'; // Set a default value for groupValue
  bool? allow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Payment', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
             SizedBox(
              height: 10,
             ),
            
              
                SizedBox(
                  height: 20,
                ),
             Padding(
               padding: const EdgeInsets.only(right: 140),
               child: Container(
                height: 23,
                width: 220,
                decoration: BoxDecoration(color: Color.fromARGB(255, 161, 209, 248)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text('Only cash on Delivey available ‼️❗'),
                )),
             ),
             SizedBox(
              height: 10,
             ),
           
          
          ValueListenableBuilder(
            valueListenable: addcartlist,
            builder: (BuildContext context,
                List<Cart> cartorderlist, Widget? child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: cartorderlist.length,
                  itemBuilder: (context, index) {
                    final data = cartorderlist[index];
              
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                        
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, bottom: 8, right: 12, top: 8),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(13),
                                            child: Image(
                                              fit: BoxFit.fill,
                                              image: FileImage(File(data.image!)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 15),
                                          Text(
                                            data.name,
                                          ),
                                          Text(
                                            'Quandity :${data.quantity.toString()}',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 65, 65, 65),
                                              fontSize: 16,
                                            ),
                                          ),
                                           Text(
                                            'Price :${data.price}',
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 65, 65, 65),
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                               
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          CartPaymBottom(
            address: widget.address,
            allow: allow,
            widget: widget,
            groupValue: groupValue,
          ),
        ],
      ),
    );
  }
}
