import 'package:flutter/material.dart';

class Screenbooking extends StatefulWidget {
  const Screenbooking({super.key});

  @override
  State<Screenbooking> createState() => _ScreenbookingState();
}

class _ScreenbookingState extends State<Screenbooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.5,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Select categories'),
                    
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.5,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter the Phone Number'),
                   
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.5,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    decoration:const  InputDecoration(
                        hintText: 'Pet Bread' ),
                    
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50.5,
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Select Time'),
                   
                  )),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            style:const ButtonStyle(fixedSize:MaterialStatePropertyAll(Size(450,50)),backgroundColor: MaterialStatePropertyAll(Colors.green) ),
            onPressed: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenPays()));
            }, child:const Text('BOOK NOW')))
      ]),
      
    );
  }
}