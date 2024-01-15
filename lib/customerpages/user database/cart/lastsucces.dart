import 'package:flutter/material.dart';
import 'package:savvy/main.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  void initState() {
    super.initState();
    //succes();
  }

  final colorizeColors = [
    const Color.fromARGB(255, 138, 219, 141),
    const Color.fromARGB(255, 8, 92, 160),
    const Color.fromARGB(255, 91, 221, 96),
    Color.fromARGB(255, 115, 172, 219),
  ];
  final colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Center(
          //   child: Image.asset('assets/successsful.gif'),
          // ),
          Stack(
        children: [
          Center(
            child: Image.network(
              'https://user-images.githubusercontent.com/2808506/56082849-399b0000-5e1e-11e9-901c-8638e14599f8.gif',
              width: 500,
              height: 700,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 50,top: 350),
          //   child: SizedBox(
          //     child: AnimatedTextKit(
          //       animatedTexts: [
          //         ColorizeAnimatedText(
          //           'order',
          //           textStyle: colorizeTextStyle,
          //           colors: colorizeColors,
          //         ),
          //          ColorizeAnimatedText(
          //           'successfully',
          //           textStyle: colorizeTextStyle,
          //           colors: colorizeColors,
          //         ),
                  
          //       ],
          //       //isRepeatingAnimation: true,
          //       onTap: () {
                  
          //       },
          //     ),
          //   ),
          // )
          Padding(
            padding: const EdgeInsets.only(top: 650,left: 150),
            child: Text('Successfully !!',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 690,left: 110),
            child: Text('Your Order was done successfully',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 730,left: 90),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black),fixedSize: MaterialStatePropertyAll(Size(250, 40))),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyApp()));
              }, child: Text(' Go to Home')),
          )
        ],
      ),
    );
  }

  // Future<void> succes() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => MyApp()));
  // }
}
