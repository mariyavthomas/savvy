import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/grommingfun.dart';

class Addgromming extends StatefulWidget {
  const Addgromming({super.key});

  @override
  State<Addgromming> createState() => _AddgrommingState();
}

class _AddgrommingState extends State<Addgromming> {
  GroHelper grohelp=GroHelper();
  final TextEditingController grommingnameController =TextEditingController();
  final TextEditingController priceController=TextEditingController();
  final TextEditingController functionalityController =TextEditingController();
  final TextEditingController timeController=TextEditingController();
  // ignore: unused_field
  File?_selectedimage;
   
   final formkey=GlobalKey<FormState>();

 @override
  void dispose() {
    grommingnameController.dispose();
    priceController.dispose();
    functionalityController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('Add Gromming',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
       body: Padding(
         padding: const EdgeInsets.all(25.0),
         child: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formkey,
                child: Column(children: [
                  GestureDetector(
                    onTap: _selectimage,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                          width: 300,
                          height: 200,
                          constraints: BoxConstraints.tightForFinite(),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: _selectedimage != null
                              ? Image.file(
                                  _selectedimage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.add_photo_alternate,
                                  size: 50,
                                  color: Colors.white,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: grommingnameController,
                      decoration: const InputDecoration(
                          labelText: "Gromming Name",
                          fillColor: Color(0xABFFFEFE),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 20),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Gromming name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        grommingnameController.text = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: timeController,
                      decoration: const InputDecoration(
                          labelText: "Gromming Time",
                          fillColor: Color(0xABFFFEFE),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 20),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Gromming Time';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        timeController.text = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: priceController,
                      decoration: const InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'Gromming price',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        priceController.text = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Center(
                      child: TextFormField(
                        maxLines: 4,
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: functionalityController,
                        decoration:  InputDecoration(
                          
                            labelText: "Functions",
                            fillColor: Color(0xABFFFEFE),
                            border: OutlineInputBorder(
                            //  borderSide:BorderSide.none
                                  // BorderSide(color:Colors.white),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Functions';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          functionalityController.text = value!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          _addgromming();
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Add product'))
                ]),
              ),
            ),
          ),
       )
    );
  }

   void _selectimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedimage = File(image.path);
      });
    }
  }

  void _addgromming() async {
    if (_selectedimage == null) {
      return;
    }
    final imagepath = _selectedimage!.path;
    final name = grommingnameController.text;
    final price = priceController.text;
    final function=functionalityController.text;
    final time=timeController.text;
    final details = Gromming(
      image: imagepath,
      time: time,
      grommingname: name,
      price:price,
      id: -1,
      functionality: function
    );
    grohelp.save(details);
     ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Grooming added successfully.'),
    ),
  );
  }
}






