import 'package:flutter/material.dart';

class Screenlanguage extends StatefulWidget {
  const Screenlanguage({super.key});

  @override
  State<Screenlanguage> createState() => _ScreenlanguageState();
}

class _ScreenlanguageState extends State<Screenlanguage> {
  bool val =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body:ListTile(
        leading:const Text('English'),
        trailing: Switch(value:val , onChanged: (value){
          if(val==true){
            val=true;
          }
          else{
            val =false;
          }
        }),
              ),
      
    );
  }
}