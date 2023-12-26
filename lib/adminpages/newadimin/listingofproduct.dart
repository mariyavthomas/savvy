// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:savvy/adminpages/newadimin/addproduct.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/adminpages/editproduct.dart';
import 'package:savvy/controller/user.controller.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
 //Pdhelper dbh= Pdhelper();
  @override
  void initState() {
    super.initState();
  getall1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           
           leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
            Navigator.pop(context);
           },
           ),
         
      
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        
        elevation: 2,
        title:Text('Product List',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Color.fromARGB(253, 255, 255, 255),
        child: ValueListenableBuilder(
          valueListenable: productlist,
          builder: (context, List<Product> adminlist, Widget? child) {
            return ListView.builder(
         //   physics:GlowingOverscrollIndicator(axisDirection: AxisDirection.down, color: Colors.transparent),
              itemCount: adminlist.length,
              itemBuilder: (context, index) {
                final product = adminlist[index];

                final imagePath = product.image;
      
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    startActionPane:
                        ActionPane(
  motion: const StretchMotion(),
  children: [
    SlidableAction(
      backgroundColor: Color.fromARGB(255, 246, 99, 31),
      label: 'Delete',
      autoClose: true,
      icon: Icons.delete,
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Deletion"),
              content: Text("Are you sure you want to delete this item?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    delete(product.id!);
                    Navigator.of(context).pop(); // Close the dialog after deletion
                  },
                  child: Text("Delete"),
                ),
              ],
            );
          },
        );
      },
    ),
  ],
),
                    endActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                          backgroundColor: Colors.green,
                          label: 'Edit',
                          icon: FontAwesomeIcons.edit,
                          autoClose: true,
                          onPressed: (context) {
                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                
                                builder: (context) => ProductEditingPage(
                                  product: product,
                                  index: index,
                                  id: product.id!,
                                ),
                              ),
                            );
                          })
                    ]),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 149,
                                height: 100,
                                // ignore: unnecessary_null_comparison
                                child: imagePath != null
                                    ? Image.file(File(
                                        imagePath)) // Display image from file path
                                    : Placeholder(), // Placeholder if no image path is provided
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 140,
                              top: 40,
                              child: Text("${product.productname}",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                            ),
                           
                            Positioned(
                              left: 140,
                              top: 70,
                              child: Text("₹${product.price}",style: TextStyle(fontWeight: FontWeight.bold),)
                            ),
                             Positioned(
                              left: 190,
                              top: 70,
                              child: Text("₹${product.category}",style: TextStyle(fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
     
    );
  }

  
}