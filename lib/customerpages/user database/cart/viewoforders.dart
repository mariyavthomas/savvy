import 'dart:io';

import 'package:flutter/material.dart';

import 'order.dart';
import 'orderfunction.dart';

//import 'package:hive_flutter/hive_flutter.dart';

class Viewoforders extends StatefulWidget {
  const Viewoforders({super.key});

  @override
  State<Viewoforders> createState() => _ViewofordersState();
}

class _ViewofordersState extends State<Viewoforders> {
  OrderHistory order1 = OrderHistory();

  @override
  void initState() {
    super.initState();
    order1.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      //   actions: [IconButton(onPressed: (){
      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>searchscreenorder()));
      //   }, icon: Icon(Icons.search,color: Colors.black,))],
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'View of Orders ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: orderhistoryNotify,
        builder: (context, List<OrderhistoryModel> orderlist, Widget? child) =>
            ListView.builder(
          itemCount: orderlist.length,
          itemBuilder: (context, index) {
            final order = orderlist[index];
            // final imagePath = gromming.image;

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
          },
        ),
      ),
    );
  }
}
