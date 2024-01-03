import 'dart:io';
import 'package:hive/hive.dart';
import 'package:savvy/customerpages/user%20database/editingprofile.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

String userEmail = '';
User ? currentUser;

class profilescreen extends StatefulWidget {
  const profilescreen({super.key});

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString('mails') ?? "";
    final userBox = await Hive.openBox<User>('users');
    currentUser = userBox.values.firstWhere(
      (user) => user.email == userEmail,
    );
    setState(() {
      
    });
  }

  // Future<String> assetToFile(String assetImagePath) async {
  //   // Create a temporary file path
  //   String tempPath =
  //       "${Directory.systemTemp.path}/${DateTime.now().millisecondsSinceEpoch}_temp.jpg";

  //   // Write the bytes to the file

  //   return tempPath;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Text(
          
          'Profile',style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color: Colors.black,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditProfileScreen(currentUser: currentUser),
                ),

              );
            },
          ),
          IconButton(onPressed: (){
            setState(() {
              
            });
          }, icon: Icon(Icons.refresh,color: Colors.black,))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: currentUser?.image !=null
                    ? FileImage(File(currentUser!.image!))
                    : null,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.person,color: Colors.grey,size: 35,)
              
              
          ,
            title:Text('${currentUser?.name}',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.email,color: Colors.grey),
            title: Text('${currentUser?.email}'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.phone,color: Colors.grey,),
             
            
            title:  Text( '${currentUser?.number}'),
          ),
        ],
      ),
    );
  }
}
