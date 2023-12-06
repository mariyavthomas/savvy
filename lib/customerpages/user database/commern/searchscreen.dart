
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/productdetails.dart';

// ignore: must_be_immutable
class searchscreen extends StatefulWidget {
  searchscreen({Key? key}) : super(key: key);

  Color colorss = Colors.white;

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  
 Pdhelper sera=Pdhelper();
  late Box<Product> _productBox = Hive.box(dbname);
  Color colorss = Colors.white;
  TextEditingController searchController = TextEditingController();
  
  

  @override
  void initState() {
    super.initState();
   sera.getall1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title:  Center(child: Text('Search ',style: TextStyle(color: Colors.black),)), 
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },icon: Icon(Icons.arrow_back),),),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Search Here',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {});
                          searchController.clear();
                        },
                        icon: Icon(Icons.close))),
                onChanged: (value) {
                  searchProducts(value);
                },
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: productlist,
              builder: (context, List<Product> adminlist, Widget? child) {
                if (adminlist.isEmpty) {
                  return Center(
                    child: Text( 'No Search Product'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: adminlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final product = adminlist[index];
                      final imagePath = product.image;
// Updated image path as a File
                      if (productlist.value.isEmpty) {
                        setState(() {});
                        return Center(
                          child: Image.asset('images/no_result.gif'),
                        );
                      } else {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: InkWell(
                                    onTap: () {
                                      showDatas(
                                        product.productname,
                                        product.image,
                                        product.decripation,
                                        product.price,
                                        product.category,
                                      );
                                    },
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
                                  "${product.productname}",
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
                                " ₹${product.price}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 211, 84, 6),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            
                          ]),)));
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void showDatas(String name, String imagepath, String discrp, String price,
      String colorss) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screenpdetails(
         decripation: discrp,
         imagePath: imagepath,
         productname: name,
         price: price,
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
}