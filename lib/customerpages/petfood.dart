import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/category/categoryfun.dart';
import 'package:savvy/adminpages/category/categoty.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/favorite/addwishlist.dart';
import 'package:savvy/customerpages/favorite/favoritefunctions.dart';
import 'dart:io';

import 'package:savvy/customerpages/productdetails.dart';
import 'package:savvy/customerpages/user%20database/categoryscreen.dart';

import 'package:savvy/customerpages/user%20database/commern/searchscreen.dart';

class Screenpetfood extends StatefulWidget {
  const Screenpetfood({Key? key}) : super(key: key);

  @override
  State<Screenpetfood> createState() => _ScreenpetfoodState();
}

class _ScreenpetfoodState extends State<Screenpetfood> {
  // Pdhelper pdh = Pdhelper();
  TextEditingController searchController = TextEditingController();
  // ignore: unused_field
  // late Box<Product> _productBox = Hive.box<Product>('product');
  late Box<Product> _productBox;
  CategoryHelper cate = CategoryHelper();
  // late Box<Category1>_categorybox=Hive.box(dbcate);
  int catenum = 0;

  @override
  void initState() {
    super.initState();
    _openBox();
    getall1();
    cate.getallcategory();
    getallfav();
  }

  Future<void> _openBox() async {
    _productBox = await Hive.openBox<Product>('product');
  }

  @override
  void dispose() {
    _productBox.close();
    super.dispose();
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
          'Pet Food',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ValueListenableBuilder(
                  valueListenable: categorylist,
                  builder:
                      (context, List<Category1> categorylist2, Widget? child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categorylist2.length,
                      itemBuilder: (BuildContext context, int index) {
                        final addtocat = categorylist2.reversed.toList()[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScreenCategory(
                                              category1:
                                                  addtocat.categoryname)));
                                },
                                child: CircleAvatar(
                                    radius: 32,
                                    backgroundImage:
                                        FileImage(File(addtocat.catimage))),
                              ),
                              SizedBox(height: 4),
                              Text(
                                addtocat.categoryname,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: productlist,
                builder: (context, List<Product> productlist, Widget? child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 220,
                    ),
                    itemCount: productlist.length,
                    itemBuilder: (context, index) {
                      final product = productlist[index];
                      final imagePath = product.image;

                      return GestureDetector(
                        onTap: () {
                          showdata1(
                              product.productname,
                              product.image,
                              product.price,
                              product.decripation,
                              product.category);
                        },
                        child: Container(
                          // height: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 228, 228),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 182, 178, 178),
                                blurRadius: 10
                                // Add other BoxShadow properties as needed
                              ),
                            ],
                          ),
                          // decoration: BoxDecoration(
                          //     color: Colors.blue,1
                          //     border: Border.all(color: Colors.black)),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: imagePath != 0
                                  ? Image.file(
                                      File(imagePath),
                                      height:
                                          150, // Adjust the height as needed
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    )
                                  : Placeholder(),
                            ),
                            Center(
                              child: Center(
                                child: Text(
                                  "${product.productname}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                children: [
                                  Text(
                                    " ₹${product.price}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 211, 84, 6),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  IconButton(
                                    icon: getIcon(product),
                                    onPressed: () {
                                      setState(() {
                                        addfav_button(product, context, index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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
        builder: (context) => Screenpdetails(
          productname: name,
          imagePath: imagepath,
          price: price,
          decripation: discrp,
        ),
      ),
    );
  }
}
