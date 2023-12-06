import 'package:flutter/material.dart';

class Editprofilepage extends StatefulWidget {
  const Editprofilepage({super.key});

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        }),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text('Edit Profile Page',style: TextStyle(color: Colors.black),),
      ),
      
    );
  }
}