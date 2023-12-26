//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/mybooking.dart';

import 'package:savvy/customerpages/login.dart';
import 'package:savvy/customerpages/oderdetails.dart';
import 'package:savvy/customerpages/profile.dart';
import 'package:savvy/customerpages/saveaddress.dart';
import 'package:savvy/customerpages/user%20database/editingprofile.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Screensettings extends StatefulWidget {
  const Screensettings({super.key});

  @override
  State<Screensettings> createState() => _ScreensettingsState();
}

class _ScreensettingsState extends State<Screensettings> {
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>  orderinfo(address:Address,color:'',imgs: '',mail: '',pin: '', name: '',qnty: '',rate: '',usern: '',)));
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Screenaddress(
                            address: 'address',
                          )));
            },
            child: ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Save Address'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Screenaddress(
                                  address: 'address',
                                )));
                  },
                  icon: const Icon(Icons.keyboard_arrow_right)),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const EditProfileScreen(currentUser: widget.currentUser),
          //         ));
          //   },
          //   child: ListTile(
          //     leading: const Icon(Icons.edit),
          //     title: const Text('Edit Profile'),
          //     trailing: IconButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => const profilescreen(),
          //               ));
          //         },
          //         icon: const Icon(Icons.keyboard_arrow_right)),
          //   ),
          // ),
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
