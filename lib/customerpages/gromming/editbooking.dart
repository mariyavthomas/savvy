import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/customerpages/gromming/bookingfunction.dart';
import 'package:savvy/customerpages/gromming/grrombook.dart';

class Editingbooking extends StatefulWidget {
  final booking;
  final int id;
  final int index;

  Editingbooking({
    super.key,
    required this.booking,
    required this.index,
    required this.id,
  });

  @override
  _EditingbookingState createState() => _EditingbookingState();
}

class _EditingbookingState extends State<Editingbooking> {
  final _formKey = GlobalKey<FormState>();
  // late TextEditingController _groomingname;
  // late String _productCategory;
  Grobook booking = Grobook();
  late TextEditingController _beered;
  // Updated to use File for selected image
  late TextEditingController _date;
  // late TextEditingController _gender;
  late TextEditingController _number;
  late TextEditingController _age;
  late TextEditingController _aggressive;
  
    @override
void initState() {
  super.initState();
  _beered = TextEditingController(text: widget.booking.breed);
  _number = TextEditingController(text: widget.booking.number);
  _age = TextEditingController(text: widget.booking.age);
  _date = TextEditingController(text: widget.booking.dateTime);
  _aggressive = TextEditingController(text: widget.booking.aggressive);
}

  
  @override
void dispose() {
  _beered.dispose();
  _number.dispose();
  _age.dispose();
  _date.dispose();
  _aggressive.dispose();
  super.dispose();
}


  DateTime selectedDate = DateTime.now();
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
        _date.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: const Text('Edit your Booking details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _beered,
                          decoration: const InputDecoration(
                            labelText: "Breed Name",
                            fillColor: Color(0xABFFFEFE),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 15),
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
                            _beered.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _number,
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
                            _number.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _age,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: "Age",
                            fillColor: Color(0xABFFFEFE),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 20),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a age ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _age.text = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _date,
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
                          controller: _aggressive,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: "Aggressive",
                            fillColor: Color(0xABFFFEFE),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 20),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Aggressive or Not ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _aggressive.text = value!;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(
                                  255, 38, 121, 246)), // Set the background color
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(
                                  255, 25, 21, 21)), // Set the text color
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                    
                            widget.booking.breed = _beered.text;
                    
                            widget.booking.dateTime = _date.text;
                            widget.booking.age = _age.text;
                            widget.booking.aggressive = _aggressive.text;
                            widget.booking.number = _number.text;
                           // widget.booking.gender = _gender.text;
                            // Check if a new image is selected
                    
                            _updatebooking();
                            setState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updatebooking() async {
    final newlist = bookinglist.value;
    final updateBox = await Hive.openBox<Bookgrom>(dbbook);

    // Update the product in Hive
    await updateBox.put(widget.id, widget.booking);
    newlist[widget.index] = widget.booking;
    bookinglist.value.clear();
    bookinglist.value.addAll(newlist);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    bookinglist.notifyListeners();
  }
}
