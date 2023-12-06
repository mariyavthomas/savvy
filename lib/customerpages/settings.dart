//import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:savvy/customerpages/home.dart';
import 'package:savvy/customerpages/language.dart';
import 'package:savvy/customerpages/login.dart';
import 'package:savvy/customerpages/profile.dart';
import 'package:savvy/customerpages/saveaddress.dart';
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
        title: Text("Settings",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: ListView(
         children: [
        //   InkWell(
        //     onTap: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => const Screenlanguage()));
        //     },
        //     child: ListTile(
        //       leading: const Icon(Icons.language),
        //       title: const Text('Select language'),
        //       trailing: IconButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const Screenlanguage()));
        //           },
        //           icon: const Icon(Icons.keyboard_arrow_right)),
        //     ),
        //   ),
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const profilescreen(),
                  ));
            },
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const profilescreen(),
                        ));
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
  void alert(BuildContext context){
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
                onPressed: () =>logout(),
                child: const Text('Yes'),
              ),
            ],
          );

        },
      );
  }
  void logout()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginForm()),(route) => false,);
  }
}
