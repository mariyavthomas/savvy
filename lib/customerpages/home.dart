import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/customerpages/aboutblep.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:savvy/customerpages/feeding.dart';
import 'package:savvy/customerpages/gromming/gromming.dart';
import 'package:savvy/customerpages/gromming/grommingsection.dart';

import 'package:savvy/customerpages/petfood.dart';
import 'package:savvy/customerpages/why.dart';

import 'favorite/favoratescreen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List imagelist = [
    {'id': 1, 'imagepath': 'assets/image/pet1.jpeg'},
    {'id': 1, 'imagepath': 'assets/image/pet4.jpeg'},
    {'id': 1, 'imagepath': 'assets/image/pet3.jpeg'},
  ];
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  //TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          elevation: 10,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 237, 234, 234),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>favourts()));
            }, icon: const Icon(Icons.favorite_border))
          ],
        ),
        drawer: Drawer(
          
          
          backgroundColor:Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 220),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: ListTile(
                  title: const Text('About SAVVY'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screenabout()));
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65, right: 30),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenWhy()));
                  },
                  title: const Text('Why SAVVY'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65, right: 30),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
               Padding(
                padding:const EdgeInsets.only(left: 50),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>const Screenfeeding() ));
                  },
                  title:const Text('Feeding Guidelines'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65, right: 30),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        
        body: ListView(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        // ignore: avoid_print
                        print(currentIndex);
                      },
                      child: CarouselSlider(
                        carouselController: carouselController,
                        items: imagelist
                            .map((item) => Image.asset(
                                  item['imagepath'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ))
                            .toList(),
                        options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 1.5,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 200),
                    //   child: Text(
                    //     'Human-Grade Pet Food',
                    //     style: TextStyle(
                    //         shadows: [
                    //           Shadow(
                    //             color: Color.fromARGB(255, 22, 22, 22), // Choose the color of the shadow
                    //             blurRadius:
                    //                 25.0, // Adjust the blur radius for the shadow effect
                    //             offset: Offset(2.0,
                    //                 2.0), // Set the horizontal and vertical offset for the shadow
                    //           ),
                    //         ],
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 30,
                    //         color: Color.fromARGB(255, 239, 238, 235)),
                    //   ),
                    // ),
                    
                 Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    const SizedBox(width: 20.0, height: 100.0),
    Center(
      child: const Text(
        'Human',
        style: TextStyle(fontSize: 43.0),
      ),
    ),
    const SizedBox(width: 20.0, height: 100.0),
    DefaultTextStyle(
      style: const TextStyle(color: Colors.white,
        fontSize: 40.0,
        fontFamily: 'Horizon',
      ),
      child: AnimatedTextKit(
        
        animatedTexts: [
          
          RotateAnimatedText('-Grade '),
          RotateAnimatedText('Pet '),
          RotateAnimatedText('Food'),
        ],
        // onTap: () {
        //   print("Tap Event");
        // },
      ),
    ),
  ],
)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Screenpetfood()));
              },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 140,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/food.jpeg"),
                          fit: BoxFit.cover),border: Border(),color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only( top: 60,
                      right: 10,left: 5),
                      child: Center(
                        child: Text('Pet Food',
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 29, 26,
                                        26), // Choose the color of the shadow
                                    blurRadius:
                                        30.0, // Adjust the blur radius for the shadow effect
                                    offset: Offset(2.0,
                                        2.0), // Set the horizontal and vertical offset for the shadow
                                  ),
                                ],
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 29)),
                      ),
                    ),
                  ),
                ),
              ),
             
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Screengrooming()));
              },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 140,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/gromming.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        right: 10,left: 5
                      ),
                      child: Center(
                        child: Text(
                          'Gromming',
                          style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 14, 13,
                                  13), // Choose the color of the shadow
                              blurRadius:
                                  30.0, // Adjust the blur radius for the shadow effect
                              offset: Offset(2.0,
                                  2.0), // Set the horizontal and vertical offset for the shadow
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Color.fromARGB(255, 243, 238, 238)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
