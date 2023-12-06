import 'package:flutter/material.dart';

class ScreenWhy extends StatefulWidget {
  const ScreenWhy({super.key});

  @override
  State<ScreenWhy> createState() => _ScreenWhyState();
}

class _ScreenWhyState extends State<ScreenWhy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text("Why Savvy",style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 450,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/new3.webp'))),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    '10%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        color: Color.fromARGB(255, 112, 181, 237),
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Center(
                    child: Text(
                  'of all cancer casesare genetic',
                  style: TextStyle(fontStyle: FontStyle.italic),
                )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            const Row(
              children: [
                Text(
                  '90%',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 100,
                      color: Color.fromARGB(255, 112, 181, 237),
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                    width: 200,
                    child: Text(
                      'are the results of lifestyle and environmental influences. ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )),
              ],
            ),
            Container(
              height: 200,
              width: 450,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/new4.webp'))),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'As pet parents, we want to see our pets live long and healthy lives. We are willing to go that extra mile to ensure our pets are happy.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        const    Row(
              children: [
              
              ],
            ),
          ],
        ),
     ] ),
    );
  }
}
