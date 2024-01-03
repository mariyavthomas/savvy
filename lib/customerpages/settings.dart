//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/mybooking.dart';

import 'package:savvy/customerpages/login.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'user database/cart/oderinfo.dart';
//import 'package:url_launcher/url_launcher.dart';

class Screensettings extends StatefulWidget {
  const Screensettings({super.key});

  @override
  State<Screensettings> createState() => _ScreensettingsState();
}

class _ScreensettingsState extends State<Screensettings> {

  final Uri _privacy = Uri.parse(
      'https://www.freeprivacypolicy.com/live/416b7466-43df-4efb-ab42-72a7372504a0');
  Future<void> privacy() async {
    if (!await launchUrl(_privacy)) {
      throw Exception('could not laounch $_privacy');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  orderhistory()));
            },
            child: ListTile(
              leading: const Icon(Icons.shop_2_outlined),
              title: const Text('My order'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const orderhistory()));
                  },
                  icon: const Icon(Icons.keyboard_arrow_right)),
            ),
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mybooking()));
            },
            child: ListTile(
              leading: const Icon(Icons.shop_2_outlined),
              title: const Text('My Booking'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mybooking()));
                  },
                  icon: const Icon(Icons.keyboard_arrow_right)),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => Screenaddress(
          //                   address: 'address',
          //                   totals:totals.toInt(),
          //                 )));
          //   },
          //   child: ListTile(
          //     leading: const Icon(Icons.save),
          //     title: const Text('Save Address'),
          //     trailing: IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => Screenaddress(
          //                         address: 'address',
          //                         totals: totals.toInt(),
          //                       )));
          //         },
          //         icon: const Icon(Icons.keyboard_arrow_right)),
          //   ),
          // ),
         InkWell(
            onTap: () {
             privacy();
            },
            child: ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy'),
              trailing: IconButton(
                  onPressed: () {
                   privacy();
                  },
                  icon: const Icon(Icons.keyboard_arrow_right)),
            ),
          ),
          ListTile(
            onTap: () {
              alert(context);
            },
            leading: const Icon(Icons.lock_open),
            title: const Text('Log Out'),
            trailing: IconButton(
                onPressed: () {
                  alert(context);
                },
                icon: const Icon(Icons.keyboard_arrow_right)),
          ),
        ],
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
