import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';
import 'package:savvy/customerpages/buy.dart';
//import 'package:savvy/customerpages/gromming/grommingsection.dart';
import 'package:savvy/list/grooming.dart';
//import 'package:savvy/list/groomingsection.dart';

class ScreenGromming extends StatefulWidget {
  const ScreenGromming({super.key});

  @override
  State<ScreenGromming> createState() => _ScreenGrommingState();
}

class _ScreenGrommingState extends State<ScreenGromming> {
  TextEditingController searchController=TextEditingController();
   late Box<Gromming>_grooming=Hive.box('gromming');
   List<Gromming> filteredProductList = [];

   Color clr=Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title:const Text("Gromming Section",style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Call a function to filter the product list based on the search input
               
    //searchProducts1(searchController.text);
                
              
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: gromminglist,
              builder: (context, gromminglist, Widget? child) {
                return ListView.builder(
                  itemCount: gromminglist.length,
                  itemBuilder: (context, index) {
                    final gromming = gromminglist[index];
                    final imagePath = gromming.image;

                    return Container(
                      width: double.infinity,
                      child: Column(children: [
                        Container(
                          width: double.infinity,
                          height: 201,
                          child: imagePath != 0
                              ? Image.file(
                                  File(imagePath),
                                )
                              : Placeholder(),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Text("${gromming.grommingname}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${gromming.price}"),
                        ElevatedButton.icon(
                           style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 53, 176, 178), // Set the background color here
  ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenPay()));
                          }, icon: Icon(Icons.badge_sharp), label: Text('Buy')),

                      ]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //  void searchProducts1(String value) {
  //   final products = _grooming.values.toList();
  //   final filteredProducts = products
  //       .where((product) =>
  //           gromming.grommingname.toLowerCase().contains(value.toLowerCase()))
  //       .toList();
  //   gromminglist.value = filteredProducts;
  // }
}