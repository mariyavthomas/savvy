import 'dart:io';

import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';

//import 'package:hive_flutter/hive_flutter.dart';


import 'booking.dart';

import 'bookingfunction.dart';

class Viewofbooking extends StatefulWidget {
  const Viewofbooking({super.key});

  @override
  State<Viewofbooking> createState() => _ViewofbookingState();
}

class _ViewofbookingState extends State<Viewofbooking> {
 Grobook book=Grobook();

  @override
  void initState() {
    super.initState();
    book.getallbooking();
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
          'View of Booking ',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: bookinglist,
        builder: (context, List<Bookgrom> bookinglist, Widget? child) => ListView.builder(
            itemCount: bookinglist.length,
            itemBuilder: (context, index) {
              final booking = bookinglist[index];
              // final imagePath = gromming.image;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        width: 400,
                        height: 350,
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
                                          child: booking.imagePath != 0
                                              ? Image.file(
                                                  File(booking.imagePath),
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
                              Text("Gromming Name: ${booking.grommingname}"),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 85),
                                child: Text("Breed: ${booking.breed}"),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Text("Age of Pet: ${booking.age}"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 31),
                                 child: Text("Date: ${booking.dateTime}"),
                               ),
                               SizedBox(
                                height: 5,
                              ),
                                Text("Aggressive or Not: ${booking.aggressive}"),
                                // Center(child: Text("${booking.gender}")),
                                SizedBox(
                                height: 5,
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text("Phone Number: ${booking.number}"),
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
                                                      book.deletebooking(
                                                          context, booking.id);
                                                      Navigator.of(context).pop();
                                                      setState(() {
                                                        book.deletebooking(
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
