import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/gromming/gromiingsearch.dart';
import 'package:savvy/customerpages/gromming/grommingdetails.dart';
import 'dart:io';


import 'package:savvy/customerpages/user%20database/commern/searchscreen.dart';

class Screengrooming extends StatefulWidget {
  const Screengrooming({Key? key}) : super(key: key);

  @override
  State<Screengrooming> createState() => _ScreengroomingState();
}

class _ScreengroomingState extends State<Screengrooming> {
  // Pdhelper pdh = Pdhelper();
  TextEditingController searchController = TextEditingController();
  // ignore: unused_field
  late Box<Product> _productBox = Hive.box(dbgroom);
  int catenum = 0;
  
  

  @override
  void initState() {
    super.initState();
    getall1();
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
                    MaterialPageRoute(builder: (context) => searchgromm()));
              },
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'Grooming',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
         
          
          
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: gromminglist,
              builder: (context, List<Gromming> gromminglist, Widget? child) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 220,
                      ),
                      itemCount: gromminglist.length,
                      itemBuilder: (context, index) {
                        final grooming = gromminglist[index];
                        final imagePath = grooming.image;
                  
                        return GestureDetector(
                          onTap: () {
                            showdata1(
                                grooming.grommingname,
                                grooming.image,
                                grooming.price,
                                grooming.functionality,
                                grooming.time!
                                );
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
                                    "${grooming.grommingname}",
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
                                  " ₹${grooming.price}",
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
    final products = _productBox.values.toList();
    final filteredProducts = products
        .where((product) =>
            product.productname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    productlist.value = filteredProducts;
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
