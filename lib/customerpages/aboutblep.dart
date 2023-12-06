import 'package:flutter/material.dart';

class Screenabout extends StatelessWidget {
  const Screenabout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("About Us",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        elevation: 40,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/grooming2.webp"), fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              // const Padding(
              //   padding: EdgeInsets.only(left: 180, top: 20),
              //   child: Text(
                  
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              //   ),
              // ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'We know the secret to our pets happy and long life starts with what we serve in their bowl. Our unconditional love for pets drives us to make the best-suited products for them. We are starting this mission with what we put in their bowl.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'Unfortunately, the Indian pet food market is dominated by foreign manufacturers supplying over-processed food with inferior ingredients.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'We have been pet parents for two decades, and we understand your commitment to your fur babies. We know how vital a nutrient-filled diet is for the overall well-being of our pets.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'At Blep, we ensure our pet food is power packed with essential nutrients keeping in mind the requirements of your dog. We use only human-grade ingredients, and our products are free of preservatives and artificial flavors.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 17,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'We will never put anything in your pets stomach that we would not feed our own. Fur babies promise!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Dedicated to our beloved Rangoli, Scooby, Sultan, Max & the many babies we have and will meet during the journey of Blep.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                          image: AssetImage("assets/image/box.jpeg"),
                          fit: BoxFit.cover),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 40.0, top: 20, right: 199),
                      child: Text(
                        'Research shows that the ingredients used along with our unique cooking method can increase your pups life by up to 3 years.',
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 21, 21,
                                    21), // Choose the color of the shadow
                                blurRadius:
                                    25.0, // Adjust the blur radius for the shadow effect
                                offset: Offset(2.0,
                                    2.0), // Set the horizontal and vertical offset for the shadow
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            color: Colors.black38),
                      ),
                    ),
                  ),
                  Container(
                    width: 430,
                    height: 100,
                    color: const Color.fromRGBO(100, 183, 250, 1),
                    child: const Column(
                      children: [
                        Text(
                          'Some of the real benefits of feeding Blep food are',
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(255, 21, 21, 21),
                                  blurRadius: 25.0,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromARGB(255, 4, 4, 4)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                'Increased Energy',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 21, 21,
                                            21), // Choose the color of the shadow
                                        blurRadius:
                                            25.0, // Adjust the blur radius for the shadow effect
                                        offset: Offset(2.0,
                                            2.0), // Set the horizontal and vertical offset for the shadow
                                      ),
                                    ],
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40, top: 20),
                              child: Text(
                                'Weight Management',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 7, 7,
                                            7), // Choose the color of the shadow
                                        blurRadius:
                                            25.0, // Adjust the blur radius for the shadow effect
                                        offset: Offset(2.0,
                                            2.0), // Set the horizontal and vertical offset for the shadow
                                      ),
                                    ],
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 55, top: 20),
                              child: Text(
                                'Shinier Coat',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 9, 9, 9),
                                        blurRadius: 25.0,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 60, top: 20),
                              child: Text(
                                'Less Smelly Poop',
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 17, 16, 16),
                                        blurRadius:
                                            25.0, // Adjust the blur radius for the shadow effect
                                        offset: Offset(2.0,
                                            2.0), // Set the horizontal and vertical offset for the shadow
                                      ),
                                    ],
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Our Story',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/began.webp'))),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                  child: Text(
                'It began with Max',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  'Max is our beloved pup who loves his squeaky toys and likes to play with his feeding bowl as if it’s his toy car. Max developed gastric issues at a young age, leading to weight gain and impaired mobility. We tried all possible brands in the market, yet nothing seemed to work.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/new1.webp'))),
              ),
              const Center(
                  child: Text(
                'The revelation of food ingredients',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  'After consulting multiple vets, we decided to cook meals for Max at home after looking at food ingredients in a traditional food bag. We were pleasantly surprised by the results. The food smelled and looked visibly better. Maxs gastric issues disappeared overnight. He lost the extra weight and jumped with renewed energy for his squeaky toy.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/new2.webp'))),
              ),
              const Center(
                  child: Text(
                'The road ahead',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
              )),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: Text(
                  'We then got together and decided to build a company we wished existed for Max. We are new, but our experience goes a long way, and we are guided by our limitless love for furry friends.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
