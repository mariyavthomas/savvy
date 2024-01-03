// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';

import 'user database/cart/bottamcart.dart';

class CartPaymentScreen extends StatefulWidget {
   double totels;
  //final  index;
  CartPaymentScreen({
    required this.address,
    super.key,
    //required this.index,
     required this.totels,
  });
  final address;
  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  @override
  void initState() {
    super.initState();
    totals;
  }
  String method = 'val';
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  String groupValue = 'Yes';
  bool? allow = false;

 List imagelist = [
    {'id': 1, 'imagepath': 'assets/image/pet1.jpeg'},
    {'id': 1, 'imagepath': 'assets/image/pet4.jpeg'},
    {'id': 1, 'imagepath': 'assets/image/pet3.jpeg'},
  ];
  int currentIndex1 = 0;
  CarouselController carouselController1 = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Payment',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          InkWell(
                      onTap: () {
                        // ignore: avoid_print
                        print(currentIndex1);
                      },
                      child: CarouselSlider(
                        carouselController: carouselController1,
                        items: imagelist
                            .map((item) => Image.asset(
                                  item['imagepath'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ))
                            .toList(),
                        options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 1.5,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex1 = index;
                              });
                            }),
                      ),
                    ),

          // ListTile(
          //   leading: Radio(
          //       value: 'Now',
          //       groupValue: groupValue,
          //       onChanged: (value) {
          //         setState(() {
          //           groupValue = value!;
          //         });
          //       }),
          //   title: const Text('UPI'),
          //   trailing: const SizedBox(
          //     width: 100,
          //   ),
          // ),

          // ListTile(
          //   leading: Radio(
          //       value: 'Now1',
          //       groupValue: groupValue,
          //       onChanged: (value) {
          //         setState(() {
          //           groupValue = value!;
          //         });
          //       }),
          //   title: const Text('Credit/Debit/ATM Card'),
          //   subtitle:
          //       const Text('Add and secure your card as per RBI quidelines'),
          // ),
          // ListTile(
          //   leading: Radio(
          //       value: 'Now2',
          //       groupValue: groupValue,
          //       onChanged: (value) {
          //         setState(() {
          //           groupValue = value!;
          //         });
          //       }),
          //   title: const Text('Net Banking'),
          // ),
          ListTile(
            leading: Radio(
                value: 'Now3',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Cash on Delivery'),
          ),

          //CartPayDelCard(widget: widget, allow: allow),
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
