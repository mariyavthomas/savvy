import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';

class ScreenCategory extends StatefulWidget {
  final String category1;

  const ScreenCategory({required this.category1, Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {
  @override
  void initState() {
    super.initState();
    
  }
   List<dynamic>filteredList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.category1, style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
        builder: (BuildContext context, List<Product> productlist, Widget? child) {
          final filteredList = productlist.where((product) => product.category == widget.category1).toList();


          if (filteredList.isEmpty) {
            return Center(
              child: Text('No Product'),
            );
          } 
          else {
            return GridView.builder(
              itemCount: filteredList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 290,
              ),
              itemBuilder: (context, index) {
                final product = filteredList[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: product.image != null
                                ? Image.file(
                                    File(product.image),
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Container(), // Handle the case where image path is null
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                // Text(
                                //   product.,
                                //   style: GoogleFonts.rubik(fontSize: 15),
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(
                                //         Icons.favorite,
                                //         color: Colors.red,
                                //       ),
                                //       onPressed: () {
                                //         // setState(() {
                                //         //   removefav(context, product.id);
                                //         // });
                                //       },
                                //     ),
                                //     IconButton(
                                //       icon: Icon(Icons.shopping_cart_outlined),
                                //       onPressed: () {},
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
