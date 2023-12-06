import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:savvy/adminpages/editproduct.dart';
import 'package:savvy/adminpages/groomingsection/editingofgrooming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';

class Gromminglist extends StatefulWidget {
  const Gromminglist({super.key});

  @override
  State<Gromminglist> createState() => _GromminglistState();
}

class _GromminglistState extends State<Gromminglist> {
  GroHelper grohelp=GroHelper();
  @override
  void initState() {
    
    super.initState();
    grohelp.getall2();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        // actions: [IconButton(onPressed: 
          
        // , icon: Icon(Icons.refresh,color: Colors.black,))],
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text('List of Grooming',style: TextStyle(color: Colors.black),),
      ),
      body:  ValueListenableBuilder(
        valueListenable: gromminglist,
        builder: (context, List<Gromming> gromminglist, Widget? child) {
          return ListView.builder(
            itemCount: gromminglist.length,
            itemBuilder: (context, index) {
              final gromming = gromminglist[index];
              final imagePath = gromming.image;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Color.fromARGB(255, 246, 99, 31),
                        label: 'Delete',
                        autoClose: true,
                        icon: Icons.delete,
                        onPressed: (context) {
                        grohelp.delete(gromming.id!);
                        })
                  ]),
                  endActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                        backgroundColor: Color.fromARGB(255, 82, 103, 135),
                        label: 'Edit',
                        icon: FontAwesomeIcons.edit,
                        autoClose: true,
                        onPressed: (context) {
                        
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              
                              builder: (context) => Grooprmingediting(
                                 grooming: gromming,
                                index: index,
                                id: gromming.id!,
                                
                              ),
                            ),
                          );
                        })
                  ]),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 149,
                            height: 201,
                            // ignore: unnecessary_null_comparison
                            child: imagePath != null
                                ? Image.file(File(
                                    imagePath)) // Display image from file path
                                : Placeholder(), // Placeholder if no image path is provided
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 173,
                          top: 62,
                          child: Text("${gromming.grommingname}",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                        ),
                       
                        Positioned(
                          left: 173,
                          top: 100,
                          child: Text("₹${gromming.price}",style: TextStyle(fontWeight: FontWeight.bold),)
                        ),
                        // Positioned(
                        //   left: 173,
                        //   top: 100,
                        //   child: Text("₹${gromming.functionality}",style: TextStyle(fontWeight: FontWeight.bold),)
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
     

    );
  }
}