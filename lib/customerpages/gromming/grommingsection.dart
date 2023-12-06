import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/booking.dart';
//import 'package:savvy/list/groomingsection.dart';

class Screengsection extends StatefulWidget {
  const Screengsection(
      {super.key,
      required this.image,
      required this.name,
      required this.features});

  final String image;
  final String name;
  final String features;

  @override
  State<Screengsection> createState() => _ScreengsectionState();
}

class _ScreengsectionState extends State<Screengsection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(" Section"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:const BoxDecoration(color: Color.fromARGB(255, 243, 179, 235)),
        child: Stack(
          children: [
            Container(
              width: 600,
              height: 275,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 9, 8, 8),
                      blurRadius: 20.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450, left: 50),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 350,
                height: 300,
                child: Text(
                  widget.features,
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 9, 8, 8),
                          blurRadius: 20.0,
                          offset: Offset(2.0, 2.0),
                        )
                      ]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style:const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(500,50)),backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screenbooking()));
                }, child:const Text('BOOKING NOW')),
            )
          ],
        ),
      ),
    );
  }
}
