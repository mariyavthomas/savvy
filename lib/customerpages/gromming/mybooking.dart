import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';
import 'package:savvy/customerpages/gromming/editbooking.dart';

import 'package:savvy/customerpages/gromming/grommingdetails.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';
import 'dart:io';

import 'bookingfunction.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({Key? key}) : super(key: key);

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  // Pdhelper pdh = Pdhelper();
  Grobook add = Grobook();
  TextEditingController searchController = TextEditingController();
  // ignore: unused_field
  late Box<Bookgrom> _bookingBox = Hive.box(dbgroom);
  int catenum = 0;

  @override
  void initState() {
    super.initState();
    add.getallbooking();
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
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'My Booking',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Horizontal Scrolling Listq

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
              valueListenable: bookinglist,
              builder: (context, List<Bookgrom> bookinglist, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                   

                    itemCount: bookinglist.length,
                    itemBuilder: (context, index) {
                      final booking = bookinglist[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            
                          },
                          child: Card(
                            child: Column(children: [
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                        child: booking.imagePath != 0
                                            ? Image.file(
                                                File(booking.imagePath),
                                                height:
                                                    100, // Adjust the height as needed
                                                width: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : Placeholder(),
                                      ),
                                    ),
                                    Center(
                                      child: Center(
                                        child: Text(
                                          "${booking.grommingname}",
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text(
                                          " ₹${booking.price}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromARGB(255, 211, 84, 6),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ]),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Editingbooking(booking: booking, id:booking.id ,index: index,)));
                                        }, icon: Icon(Icons.edit)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 150),
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
                                                title:
                                                    Text('Delete Confirmation'),
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
                                                      add.deletebooking(
                                                          context, booking.id);
                                                      Navigator.of(context).pop();
                                                      setState(() {
                                                        add.deletebooking(
                                                            context, booking.id);
                                                        Navigator.of(context)
                                                            .pop();
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
                              )
                            ]),
                          ),
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
    final booking = _bookingBox.values.toList();
    final filteredProducts = booking
        .where((booking) =>
            booking.grommingname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    bookinglist.value = filteredProducts;
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
