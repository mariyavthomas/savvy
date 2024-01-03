import 'dart:io';

import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/bookingfunction.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';

class Screenbooking extends StatefulWidget {
  const Screenbooking(
      {super.key, required this.imagepath, required this.grommingname, required this.price});
  final String imagepath;
  final grommingname;
  final price;

  @override
  State<Screenbooking> createState() => _ScreenbookingState();
}

class _ScreenbookingState extends State<Screenbooking> {
  Grobook book = Grobook();
  TextEditingController breedController = TextEditingController();
  TextEditingController genderConteroller = TextEditingController();
  TextEditingController aggressiveController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController grommingname = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  void dispose() {
    breedController.dispose();
    genderConteroller.dispose();
    ageController.dispose();
    aggressiveController.dispose();
    sizeController.dispose();
    numbercontroller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        datecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'Pet Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(widget.imagepath)),
                      ),
                    ),
                  ),
                ),
                Text('${widget.grommingname}'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: breedController,
                    decoration: const InputDecoration(
                      labelText: "Breed Name",
                      fillColor: Color(0xABFFFEFE),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 15),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Breed name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      breedController.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: numbercontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        fillColor: Color(0xABFFFEFE),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 20),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter a number';
                      }

                      if (!isPhone(value)) {
                        return 'Enter Valid Phone Number';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      numbercontroller.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ageController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Age",
                      fillColor: Color(0xABFFFEFE),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 20),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a age ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      ageController.text = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: datecontroller,
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: aggressiveController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Aggressive",
                      fillColor: Color(0xABFFFEFE),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 20),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Aggressive or Not ';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      aggressiveController.text = value!;
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700),
            child: ElevatedButton(
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(450, 50)),
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();

                    setState(() {
                      addBooking();
                      ageController.clear();
                      breedController.clear();
                      datecontroller.clear();
                      genderConteroller.clear();
                      ageController.clear();
                      numbercontroller.clear();

                    });
                  }
                },
                child: const Text('BOOK NOW')),
          )
        ]),
      ),
    );
  }

  void addBooking() async {
    final age = ageController.text;
    final breed = breedController.text;
    final date = datecontroller.text;
    final gender = genderConteroller.text;
    final aggressive = aggressiveController.text;
    final number = numbercontroller.text;
    final bookingdetails = Bookgrom(
    price: widget.price,
    grommingname: widget.grommingname,
    imagePath: widget.imagepath,
      aggressive: aggressive,
      age: age,
      breed: breed,
      dateTime: date,
      gender: gender,
      number: number,
      id: -1,
    );
    book.savebooking(bookingdetails);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking added successfully.'),
      ),
    );
  }
}
