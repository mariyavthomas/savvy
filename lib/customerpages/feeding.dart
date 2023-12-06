import 'package:flutter/material.dart';

class Screenfeeding extends StatefulWidget {
  const Screenfeeding({super.key});

  @override
  State<Screenfeeding> createState() => _ScreenfeedingState();
}

class _ScreenfeedingState extends State<Screenfeeding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Feeding Guidelines",style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                
              height: 200,
              width: 650,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/enery.jpeg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('How can pet lovers help support their dog or cat’s overall well-being and a long and healthy life? These feeding guidelines help pets maintain a healthy weight and ensure they receive complete nutrition.The caloric and nutrient needs of individual pets, even those of similar size, can vary significantly. Age, lifestyle, activity level, breed, and whether the animal is spayed or neutered all can affect the number of calories and nutrients needed to keep a pet healthy. The calorie content of different pet food products can also vary.Pet food makers use nutrient profiles established by the Association of American Feed Control Officials (AAFCO) as baselines for formulating pet food recipes to ensure the 40 essential nutrients dogs and cats need are included at the proper levels.',style: TextStyle(wordSpacing: 5,fontStyle: FontStyle.italic,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('While it may be tempting to estimate your dog or cat’s food measurement, it can lead to overfeeding and weight gain. It is important to review the feeding guidelines listed on a pet food packages to ensure you are properly feeding your cat or dog. Feeding directions for a pet food are based on the levels of nutrients and calories recommended for populations of pets, such as weight and life-stage. Based on your pet’s specific needs, feeding guidelines may need to be modified at a veterinarian’s direction.',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,wordSpacing: 5),),
            )
            ],
          )
        ],
      ),
    );
  }
}