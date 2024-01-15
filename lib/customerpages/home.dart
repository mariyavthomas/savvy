import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:savvy/customerpages/aboutblep.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:savvy/customerpages/feeding.dart';

import 'package:savvy/customerpages/petfood.dart';
import 'package:savvy/customerpages/why.dart';

import 'favorite/favoratescreen.dart';
import 'favorite/favorite.dart';
import 'gromming/gromming.dart';

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
  int favoriteCount = 0;

  @override
  void initState() {
    super.initState();
  }

  final Box<Favorite> favBox = Hive.box<Favorite>('fav');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color.fromARGB(255, 255, 255, 255),
      statusBarIconBrightness: Brightness.dark,
    ));
    // ignore: unused_local_variable

    return Scaffold(
        appBar: appbarhome(context),
        drawer: drawar(context),
        body: ListView(children: [
          Column(
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(width: 20.0, height: 150.0),
                        const Text(
                          '“Our”',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20.0, height: 100.0),
                        DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontFamily: 'Horizon',
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText('pets'),
                              RotateAnimatedText('are our '),
                              RotateAnimatedText('family'),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screenpetfood()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/food.jpeg"),
                          fit: BoxFit.cover),
                      border: Border(),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 60, right: 10, left: 5),
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
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScreenGromming()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/gromming.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 60, right: 10, left: 5),
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

  Drawer drawar(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
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
              padding: const EdgeInsets.only(left: 50),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screenfeeding()));
                },
                title: const Text('Feeding Guidelines'),
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
      );
  }

  AppBar appbarhome(BuildContext context) {
    return AppBar(
      elevation: 10,
      shadowColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favourite()),
                  );
                });
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: Colors.green, // You can customize the color
                ),
                child: Text(
                  '${favBox.length}', // Replace with the actual count or any text you want
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
