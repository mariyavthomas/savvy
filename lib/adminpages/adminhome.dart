import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import 'package:savvy/adminpages/addproduct.dart';
import 'package:savvy/adminpages/category/addcategory.dart';
import 'package:savvy/adminpages/groomingsection/listingofgromming.dart';
import 'package:savvy/adminpages/newadimin/listingofproduct.dart';
import 'package:savvy/adminpages/userlist.dart';
import 'package:savvy/customerpages/gromming/viewofbookingadmin.dart';

import 'package:savvy/customerpages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customerpages/user database/cart/viewoforders.dart';
import 'groomingsection/addgromming.dart';

class HomeadimScreen extends StatefulWidget {
  const HomeadimScreen({Key? key}) : super(key: key);

  @override
  State<HomeadimScreen> createState() => _HomeadimScreenState();
}

class _HomeadimScreenState extends State<HomeadimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home',style: TextStyle(color: Colors.black),)),
        actions: [IconButton(onPressed: (){
           alert(context);
        }, icon: Icon(Icons.lock_open,color: Colors.black,))],
      backgroundColor: Colors.white,
      ),
     body:  Padding(
       padding: const EdgeInsets.all(20.0),
       child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             
               SizedBox(
                 height: 800,
                 width: 600,
                 child: GridView(
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       childAspectRatio: 50 / 30,
                       crossAxisCount: 2,
                       mainAxisSpacing: 16),
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) =>
                                                 const Screenaddproduct()));
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 3, 124, 177),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   padding: const EdgeInsets.all(5),
                                   // color:const  Color.fromARGB(255, 3, 124, 177),
                                   child: const Icon(
                                     Icons.window_outlined,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                   onPressed: () {
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) =>
                                                 const Screenaddproduct()));
                                   },
                                   icon: const Icon(Icons.add)),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     "Add Product",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) =>
                                               ProductListingPage()));
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 3, 177, 93),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   padding: const EdgeInsets.all(5),
                                   child: const Icon(
                                     Icons.list,
                                     color: Color.fromARGB(255, 247, 242, 242),
                                     size: 25,
                                   )),
                               trailing: InkWell(
                                   onTap: () {
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) =>
                                                 ProductListingPage()));
                                   },
                                   child: const Icon(Icons.more_vert)),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     "Product List",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Addgromming()));
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                                 leading: Container(
                                     padding: const EdgeInsets.all(5),
                                     decoration: const BoxDecoration(
                                         color: Color.fromARGB(255, 177, 113, 3),
                                         borderRadius:
                                             BorderRadius.all(Radius.circular(5))),
                                     child: const Icon(
                                       Icons.palette_outlined,
                                       color: Colors.white,
                                       size: 25,
                                     )),
                                 trailing: IconButton(
                                   icon: Icon(Icons.add),
                                   onPressed: () {
                                     Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                             builder: (context) => Addgromming()));
                                   },
                                 )),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     " Add Gromming ",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => Gromminglist()));
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   padding: const EdgeInsets.all(5),
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 177, 3, 119),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   child: const Icon(
                                     Icons.list,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                 icon: Icon(Icons.more_vert),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Gromminglist()));
                                 },
                               ),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     " Gromming List ",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => Userlist()));
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   padding: const EdgeInsets.all(5),
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 3, 124, 177),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   child: const Icon(
                                     Icons.people,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                 icon: Icon(Icons.more_vert),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Userlist()));
                                 },
                               ),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     "View the customer",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                        setState(() {
                            Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ScreenaddCategory()));
                        });
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   padding: const EdgeInsets.all(5),
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 7, 179, 199),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   child: const Icon(
                                     Icons.add,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                 icon: Icon(Icons.more_vert),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => ScreenaddCategory()));
                                 },
                               ),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     " Add Category ",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                        setState(() {
                            Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Viewofbooking()));
                        });
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   padding: const EdgeInsets.all(5),
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 177, 3, 119),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   child: const Icon(
                                     Icons.bookmark,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                 icon: Icon(Icons.more_vert),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Viewofbooking()));
                                 },
                               ),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     "View of All Booking",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                      Padding(
                       padding: const EdgeInsets.all(8),
                       child: GestureDetector(
                        onTap: () {
                        setState(() {
                            Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Viewoforders()));
                        });
                        },
                         child: Card(
                          color: const Color.fromARGB(255, 229, 206, 206),
                           child: GridTile(
                             header: ListTile(
                               leading: Container(
                                   padding: const EdgeInsets.all(5),
                                   decoration: const BoxDecoration(
                                       color: Color.fromARGB(255, 12, 28, 206),
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(5))),
                                   child: const Icon(
                                     Icons.bookmark,
                                     color: Colors.white,
                                     size: 25,
                                   )),
                               trailing: IconButton(
                                 icon: Icon(Icons.more_vert),
                                 onPressed: () {
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => Viewoforders()));
                                 },
                               ),
                             ),
                             child: Container(
                               margin: const EdgeInsets.only(left: 8.0, top: 50),
                               child: const Align(
                                   alignment: Alignment.centerLeft,
                                   child: Text(
                                     "View of All Orders",
                                     style: TextStyle(fontSize: 15),
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ),
                    
                   ],
                 ),
               )
             ],
           ),
         ),
     ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('LogOut'),
          content: const Text('Are you logout'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => logout(),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginForm()),
      (route) => false,
    );
  }
}
