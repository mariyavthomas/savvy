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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [IconButton(onPressed:

        // , icon: Icon(Icons.refresh,color: Colors.black,))],
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
                children: [
                  Card(
                    elevation: 8,
                    color: Colors.black,
                    child: Container(
                      width: 400,
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                child: order.image != 0
                                    ? Image.file(
                                        File(order.image),
                                        height:
                                            150, // Adjust the height as needed
                                        width: 350,
                                        fit: BoxFit.cover,
                                      )
                                    : Placeholder(),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Product Name: ${order.productname}"),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 85),
                              child: Text("Price: ${order.price}"),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 85),
                              child: Text("quantity: ${order.quantity}"),
                            ),
                            Text('Address'),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text("Name: ${order.usrname}"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 31),
                              child: Text("Phone Number: ${order.mobile}"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Email : ${order.mail}"),
                            // Center(child: Text("${booking.gender}")),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text("House Name: ${order.housename}"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text("Dis: ${order.dis}"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text("House Name: ${order.pincode}"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text("House Name: ${order.post}"),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 180,
                                child: ListTile(
                                  trailing: Icon(Icons.delete),
                                  onTap: () {
                                    // Show a confirmation dialog before deleting
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Confirmation'),
                                          content: Text(
                                              'Are you sure you want to delete this item?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Delete the item and close the dialog
                                                order1.delete(order.id!);
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  order1.delete(order.id!);
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  //title: Text('Delete'),
                                ),
                              ),
                            ),
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
