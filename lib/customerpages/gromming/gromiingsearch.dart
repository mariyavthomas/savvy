
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';
import 'package:savvy/customerpages/gromming/grommingdetails.dart';




// ignore: must_be_immutable
class searchgromm extends StatefulWidget {
  searchgromm({Key? key}) : super(key: key);

  //Color colorss = Colors.white;

  @override
  State<searchgromm> createState() => _searchgrommState();
}

class _searchgrommState extends State<searchgromm> {
  
//  Pdhelper sera=Pdhelper();
  late Box<Gromming> _grommingBox = Hive.box(dbgroom);
  Color colorss = Colors.white;
  TextEditingController searchController = TextEditingController();
  GroHelper gromm=GroHelper();
  

  @override
  void initState() {
    super.initState();
     gromm.getall2();
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
              valueListenable: gromminglist,
              builder: (context, List<Gromming> gromminglist, Widget? child) {
                if (gromminglist.isEmpty) {
                  return Center(
                    child: Text( 'No Search Product'),
                  );
                } else {
                  return GridView.builder(
                    itemCount: gromminglist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final gromming = gromminglist[index];
                      final imagePath = gromming.image;
// Updated image path as a File
                      if (gromminglist.isEmpty) {
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
                                         gromming.grommingname,
                              gromming.image,
                              gromming.price,
                              gromming.functionality,
                              gromming.time.toString()
                                       
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
                                  "${gromming.grommingname}",
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
                                " ₹${gromming.price}",
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

  void showDatas(String name,  String imagePath, String price,String discrp,
     String category ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenGrommingdetails(
         grommingname: name,
          imagePath: imagePath,
          price: price,
          functionality: discrp,
        ),
      ),
    );
  }

  void searchProducts(String value) {
    final gromming = _grommingBox.values.toList();
    final filteredProducts = gromming
        .where((grommings) =>
            grommings.grommingname.toLowerCase().contains(value.toLowerCase()))
        .toList();
    gromminglist.value = filteredProducts;
  }
}