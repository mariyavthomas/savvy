import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvy/customerpages/favorite/addwishlist.dart';
import 'package:savvy/customerpages/favorite/favorite.dart';
import 'package:savvy/customerpages/favorite/favoritefunctions.dart';

import '../productdetails.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    super.initState();
    getallfav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
       
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Favourite',
          style: TextStyle(color: Colors.black)
        ),
      ),
      body: Column(
        children: [
          
          SizedBox(
            height: 25,
          ),
          ValueListenableBuilder(
              valueListenable: favoritelist,
              builder: (context, List<Favorite> favoritelist, Widget? child) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: favoritelist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 290,
                    ),
                    itemBuilder: (context, index) {
                      final addfav = favoritelist.reversed.toList()[index];
                    
                      return GestureDetector(
                        onTap: () {
                         showdata1(
                              addfav.productname,
                              addfav.image,
                              addfav.price,
                              addfav.decripation,
                             // addfav.category
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                    child: Image.file(
                                      File(addfav.image),
                                      fit: BoxFit.cover,
                                      height: 163,
                                      width: double.infinity,
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          addfav.productname,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                     
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                           Center(
                                        child: Text(addfav.price,
                                            style: GoogleFonts.rubik(
                                                color: Colors.green,
                                                fontSize: 15)),
                                      ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                deletefav(context, addfav.id);
                                              });
                                            },
                                          ),
                                         
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
  void showdata1(String name, String imagepath, String price, String discrp,
     ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screenpdetails(
          productname: name,
          imagePath: imagepath,
          price: price,
          decripation: discrp,
        ),
      ),
    );
  }
}