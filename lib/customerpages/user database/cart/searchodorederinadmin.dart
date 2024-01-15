
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/controller/user.controller.dart';

import 'order.dart';
import 'orderfunction.dart';

// ignore: must_be_immutable
class searchscreenorder extends StatefulWidget {
  searchscreenorder({Key? key}) : super(key: key);

  Color colorss = Colors.white;

  @override
  State<searchscreenorder> createState() => _searchscreenorderState();
}

class _searchscreenorderState extends State<searchscreenorder> {
  
//  Pdhelper sera=Pdhelper();
  late Box<OrderhistoryModel> _ordersBox = Hive.box('order_history_db');
  Color colorss = Colors.white;
  TextEditingController searchController = TextEditingController();
  
  

  @override
  void initState() {
    super.initState();
   getall1();
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
      body: ListView(
        children:[ Column(
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
                valueListenable: orderhistoryNotify,
                builder: (context, List<OrderhistoryModel> orderhistoryNotify, Widget? child) {
                  if (orderhistoryNotify.isEmpty) {
                    return Center(
                      child: Text( 'No Search Product'),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: orderhistoryNotify.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 3,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final order = orderhistoryNotify[index];
                        // ignore: unused_local_variable
                        final imagePath = order.image;
      // Updated image path as a File
                        if (productlist.value.isEmpty) {
                          setState(() {});
                          return Center(
                            child: Image.asset('images/no_result.gif'),
                          );
                        } else {
                          return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 8,
                      //color: Colors.black,
                      child: Container(
                        width: 400,
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: order.image != 0
                                      ? Image.file(
                                          File(order.image),
                                          height: 150,
                                          width: 350,
                                          fit: BoxFit.cover,
                                        )
                                      : Placeholder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Product Name: ${order.productname}"),
                              SizedBox(height: 5),
                              Text("Price: ${order.price}"),
                              SizedBox(height: 3),
                              Text("Quantity: ${order.quantity}"),
                              Text('Address'),
                              Text("Name: ${order.usrname}"),
                              SizedBox(height: 5),
                              Text("Phone Number: ${order.mobile}"),
                              SizedBox(height: 5),
                              Text("Email: ${order.mail}"),
                              SizedBox(height: 5),
                              Text("House Name: ${order.housename}"),
                              SizedBox(height: 5),
                              Text("District: ${order.dis}"),
                              SizedBox(height: 5),
                              Text("Pincode: ${order.pincode}"),
                              SizedBox(height: 5),
                              Text("Post: ${order.post}"),
                             
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
     ] ),
    );
  }



  void searchProducts(String value) {
    final order = _ordersBox.values.toList();
    final filteredProducts = order
        .where((order) =>
            order.productname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    orderhistoryNotify.value = filteredProducts;
  }
}