import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/gromming/grommingdetails.dart';
import 'dart:io';

import 'package:savvy/customerpages/productdetails.dart';
import 'package:savvy/customerpages/user%20database/cart/cart.dart';
import 'package:savvy/customerpages/user%20database/cart/cartfunction.dart';
import 'package:savvy/customerpages/user%20database/commern/searchscreen.dart';

class ScreenGromming extends StatefulWidget {
  const ScreenGromming({Key? key}) : super(key: key);

  @override
  State<ScreenGromming> createState() => _ScreenGrommingState();
}

class _ScreenGrommingState extends State<ScreenGromming> {
  GroHelper pdh = GroHelper();
  TextEditingController searchController = TextEditingController();
  // ignore: unused_field
  late Box<Gromming> _grommingbox = Hive.box('gromming');
  
  


  @override
  void initState() {
    super.initState();
    pdh.getall2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => searchscreen()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'Grooming ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          // Horizontal Scrolling Listq
          
         SizedBox(
          height: 10,
         ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: gromminglist,
              builder: (context, List<Gromming> gromminglist, Widget? child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 220,
                    ),
                    itemCount: gromminglist.length,
                    itemBuilder: (context, index) {
                      final gromming = gromminglist[index];
                      final imagePath = gromming.image;

                      return GestureDetector(
                        onTap: () {
                          showdata1(
                              gromming.grommingname,
                              gromming.image,
                              gromming.price,
                              gromming.functionality,
                              gromming.time.toString());
                        },
                        child: Container(
                          //decoration: BoxDecoration(color: Colors.blue,border: Border.all(color: Colors.black)),
                          child: Column(children: [
                            SizedBox(
                              height: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: imagePath != 0
                                  ? Image.file(
                                      File(imagePath),
                                      height:
                                          170, // Adjust the height as needed
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )
                                  : Placeholder(),
                            ),
                            Center(
                              child: Center(
                                child: Text(
                                  "${gromming.grommingname}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                " ₹${gromming.price}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 211, 84, 6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchProducts(String value) {
    final gromming = _grommingbox.values.toList();
    final filteredProducts = gromming
        .where((gromming) =>
            gromming.grommingname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    gromminglist.value = filteredProducts;
  }

  void showdata1(String name, String imagepath, String price, String discrp,
      String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenGrommingdetails(
          grommingname: name,
          imagePath: imagepath,
          price: price,
          functionality: discrp,
        ),
      ),
    );
  }
}
