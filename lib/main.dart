// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/adminpages/addproduct.dart';

import 'package:savvy/adminpages/adminhome.dart';
import 'package:savvy/adminpages/category/categoty.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';

import 'package:savvy/customerpages/home.dart';
import 'package:savvy/customerpages/login.dart';

import 'package:savvy/customerpages/profile.dart';
import 'package:savvy/customerpages/settings.dart';
import 'package:savvy/customerpages/splash.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';

import 'customerpages/favorite/favorite.dart';
import 'customerpages/user database/cart/cart.dart';
import 'customerpages/user database/cart/order.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: constant_identifier_names
const Save_key = 'userlogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAo1K1DEFUITQZb93jDCcFvoR90Lp0ZINI",
  projectId: "savvydemo-93586",
  //storageBucket: "savvydemo-93586.appspot.com",
  messagingSenderId: "322330999565",
  appId: "1:322330999565:web:11b1b84f8b9e62bacc8e44",
 // measurementId: "G-CN9EB68BES"
          
         
         ));
  await Hive.initFlutter();
  Hive.openBox<Favorite>('fav');
  //Hive.openBox<Cart>('cart');
  Hive.registerAdapter(UserAdapter()); 
  Hive.registerAdapter(GrommingAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(FavoriteAdapter());
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(Category1Adapter());
  Hive.registerAdapter(BookgromAdapter());
  Hive.registerAdapter(OrderhistoryModelAdapter());
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(MaterialApp(
    home: FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('error');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenSpalsh();
        }
        return CircularProgressIndicator();
      },
    ),
    debugShowCheckedModeBanner: false,
  )
//ScreenSpalsh(),
      );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late  Box<Cart> cartBox =Hive.box<Cart>('cart');
  int indexNum = 0;
  List tabwidget = [
  const  ScreenHome(),
    const Screensettings(),
   const  cartscreens(),
    const profilescreen()
  ];
  //@override
  // void dispose() {
  //   //Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                 backgroundColor: Colors.white),
          BottomNavigationBarItem(
  icon: Icon(Icons.production_quantity_limits_outlined)
  ,
  label: "Cart",
  backgroundColor: Colors.white,
),


            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.white),
          ],
          iconSize: 25,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          currentIndex: indexNum,
          onTap: (int index) {
            setState(() {
              indexNum = index;
            });
          },
        ),
        body: Center(
          child: tabwidget.elementAt(indexNum),
        ));
  }
}
