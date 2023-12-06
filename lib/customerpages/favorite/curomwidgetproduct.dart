import 'dart:io';

import 'package:savvy/customerpages/favorite/favorite.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class customeproduct extends StatefulWidget {
  customeproduct({
    
    this.disc,
    required this.image,
    required this.productname,
    required this.price,
    this.colors,
    super.key,
  });
  String image;
  String productname;
  String price;
  Color? colors;
  
  String? disc;

  @override
  State<customeproduct> createState() => _customeproductState();
}

class _customeproductState extends State<customeproduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 150,
                height: 200,
                child: Image.file(File(widget.image)),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    final wishBox = Hive.box<Favorite>('wish');
                    final wishExists = wishBox.values
                        .any((wishlists) => wishlists.productname == widget.productname);
                    if (wishExists) {
                      widget.colors = Colors.red;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('All Ready product in favorite'),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      setState(() {
                        widget.colors = Colors.red;
                      });
                      wishBox.add(
                        Favorite(
                            productname: widget.productname,
                            image: widget.image,
                            price: widget.price,
                            decripation: widget.disc!,
                           id: -1),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Add In WishList'),
                        backgroundColor: Colors.green,
                      ));
                    }
                  },
                  icon: Icon(Icons.favorite),
                  iconSize: 35,
                  color: widget.colors,
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}