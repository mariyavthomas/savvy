// ignore_for_file: use_build_context_synchronously

//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:savvy/customerpages/login.dart';
import 'package:savvy/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:lottie/lottie.dart';

class ScreenSpalsh extends StatefulWidget {
  const ScreenSpalsh({super.key});

  @override
  State<ScreenSpalsh> createState() => _ScreenSpalshState();
}

class _ScreenSpalshState extends State<ScreenSpalsh> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
          Center(
            child: Image.network('https://i.pinimg.com/originals/af/8f/6c/af8f6c1b9db5b1da36069285ee82c402.gif',
                width: 500,
                height: 700,
                ),
            
          ),
        
        // SizedBox(
        //   width: 258.0,
        //   child: TextLiquidFill(
        //     text: 'SAVVY',
        //     waveColor: Color.fromARGB(255, 91, 59, 128),
        //     boxBackgroundColor: const Color.fromARGB(255, 255, 252, 252),
        //     textStyle: const TextStyle(
        //         fontSize: 50.0,
        //         fontWeight: FontWeight.bold,
        //         fontStyle: FontStyle.italic),
        //     boxHeight: 300.0,
        //   ),
        // ),
    
      ]),
    ));
  }

// @override
//   void dispose() {
//     super.dispose();
//   }

  Future<void> loginFalse() async {
    await Future.delayed(const Duration(seconds: 6));
    // ignore: prefer_const_constructors
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginForm()));
    // Navigator.pushReplacement(
    //     , MaterialPageRoute(builder: (context) => LoginForm()));
  }

  Future<void> logintrue() async {
    await Future.delayed(const Duration(seconds: 6));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
  }

  Future<void> gotoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getBool(Save_key);

    if (login == true) {
      logintrue();
    } else {
      loginFalse();
    }
  }
}
