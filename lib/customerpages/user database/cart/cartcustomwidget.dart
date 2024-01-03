import 'dart:io';


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customecart extends StatelessWidget {
  customecart({
    required this.image,
    required this.productname,
   required this.decripation,
    this.quantity,
    required this.price,
    super.key,
  });
  final image;
  final productname;
  String decripation;
  String? quantity;
  String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Container(
                  width: 102,
                  height: 104,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: FileImage(File(image)),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                     Text(productname),
                     SizedBox(
                      height: 10,
                     ),
                     Text(price),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}