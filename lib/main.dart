// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/adminpages/addproduct.dart';

import 'package:savvy/adminpages/adminhome.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
//import 'package:savvy/adminpages/repositary/box.dart';
//import 'package:savvy/customerpages/addtocart.dart';
//import 'package:savvy/adminpages/database/logindb.dart';
//import 'package:savvy/customerpages/splash.dart';
import 'package:savvy/customerpages/home.dart';
import 'package:savvy/customerpages/login.dart';
//import 'package:savvy/customerpages/login.dart';
//import 'package:savvy/customerpages/login.dart';
import 'package:savvy/customerpages/profile.dart';
import 'package:savvy/customerpages/settings.dart';
import 'package:savvy/customerpages/splash.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';

import 'customerpages/favorite/favorite.dart';
import 'customerpages/user database/cart/cart.dart';

// ignore: constant_identifier_names
const Save_key = 'userlogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //await BoxHelper.openBox();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(GrommingAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(FavoriteAdapter());
 Hive.registerAdapter(CartAdapter());
  runApp( MaterialApp(
    
    home: LoginForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indexNum = 0;
  List tabwidget = [
    const ScreenHome(),
    const Screensettings(),
    const cartscreens(),
    const profilescreen()
  ];@override
  void dispose() {
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.production_quantity_limits),
                label: "Cart",
                backgroundColor: Colors.white),
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
