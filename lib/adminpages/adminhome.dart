import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import 'package:savvy/adminpages/addproduct.dart';
import 'package:savvy/adminpages/groomingsection/listingofgromming.dart';
import 'package:savvy/adminpages/newadimin/listingofproduct.dart';
import 'package:savvy/adminpages/userlist.dart';

import 'package:savvy/customerpages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
     body:  SingleChildScrollView(
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
                     child: Card(
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
                   Padding(
                     padding: const EdgeInsets.all(8),
                     child: Card(
                       child: GridTile(
                         header: ListTile(
                           leading: Container(
                               decoration: const BoxDecoration(
                                   color: Color.fromARGB(255, 3, 177, 93),
                                   borderRadius:
                                       BorderRadius.all(Radius.circular(5))),
                               padding: const EdgeInsets.all(5),
                               child: const Icon(
                                 Icons.reviews,
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
                   Padding(
                     padding: const EdgeInsets.all(8),
                     child: Card(
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
                   Padding(
                     padding: const EdgeInsets.all(8),
                     child: Card(
                       child: GridTile(
                         header: ListTile(
                           leading: Container(
                               padding: const EdgeInsets.all(5),
                               decoration: const BoxDecoration(
                                   color: Color.fromARGB(255, 177, 3, 119),
                                   borderRadius:
                                       BorderRadius.all(Radius.circular(5))),
                               child: const Icon(
                                 Icons.campaign,
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
                   Padding(
                     padding: const EdgeInsets.all(8),
                     child: Card(
                       child: GridTile(
                         header: ListTile(
                           leading: Container(
                               padding: const EdgeInsets.all(5),
                               decoration: const BoxDecoration(
                                   color: Color.fromARGB(255, 3, 124, 177),
                                   borderRadius:
                                       BorderRadius.all(Radius.circular(5))),
                               child: const Icon(
                                 Icons.analytics,
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
                                 "View the cutomer",
                                 style: TextStyle(fontSize: 15),
                               )),
                         ),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8),
                     child: Card(
                       child: ListTile(
                         leading: Icon(
                           Icons.add_circle,
                           color: Color.fromARGB(96, 128, 125, 125),
                           size: 50,
                         ),
                         subtitle: Text(
                           "Add Shortcut",
                           style: TextStyle(fontSize: 15),
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             )
           ],
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
