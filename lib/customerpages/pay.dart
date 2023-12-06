import 'package:flutter/material.dart';

class ScreenPays extends StatefulWidget {
  const ScreenPays({super.key});

  @override
  State<ScreenPays> createState() => _ScreenPaysState();
}

class _ScreenPaysState extends State<ScreenPays> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.blue),
        child:Center(child: const Text('Successfully Payment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
      )
    );

  }
}