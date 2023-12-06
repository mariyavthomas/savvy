import 'dart:io';

import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'grommingdb/grommingfun.dart';

class Grooprmingediting extends StatefulWidget {
  final grooming;
  final int id;
  final int index;
  

 Grooprmingediting(
      {super.key,
      required this.grooming,
      required this.index,
      required this.id,
      });

  @override
  _GrooprmingeditingState createState() => _GrooprmingeditingState();
}

class _GrooprmingeditingState extends State<Grooprmingediting> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _groomingname;
  // late String _productCategory;
  GroHelper groHelper = GroHelper();
  late TextEditingController _productPrice;
  String? _selectedImage; // Updated to use File for selected image
  late TextEditingController _productdis;
  late TextEditingController _time;
  @override
  void initState() {
    super.initState();
    _groomingname = TextEditingController(text: widget.grooming.grommingname);

    _productPrice =
     TextEditingController(text: widget.grooming.price);
    _productdis = TextEditingController(text: widget.grooming.functionality);
    _time=TextEditingController(text:widget.grooming.time );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          setState(() {
            
          });
        }, icon: Icon(Icons.refresh,color: Colors.black,))],
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
        title: const Text('Edit your product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _selectImage2,
                    child: Container(
                      width: 100,
                      height: 150,
                      constraints: BoxConstraints.tightForFinite(),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: _selectedImage != null
                          ? Image.file(
                              File(_selectedImage!),
                              // fit: BoxFit.cover,
                            )
                          : (widget.grooming.image.isNotEmpty
                              ? Image.file(File(widget.grooming.image))
                              : Container()), // Show an empty container if product's image is empty
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _groomingname,
                    decoration: const InputDecoration(
                      labelText: 'Grooimg Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a grooming name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _time,
                    decoration: const InputDecoration(
                      labelText: 'Grooimg Time',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a grooming Time';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productPrice,
                    decoration: const InputDecoration(
                      labelText: 'Grooming Price',
                      border: OutlineInputBorder(),
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
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _productdis,
                    decoration: const InputDecoration(
                      labelText: 'Functionality',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Grooming name';
                      }
                      return null;
                    },
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

                        widget.grooming.grommingname = _groomingname.text;

                        widget.grooming.time=_time.text;
                        widget.grooming.price = _productPrice.text;
                        widget.grooming.functionality = _productdis.text;
                        // Check if a new image is selected
                        if (_selectedImage != null) {
                          widget.grooming.image = _selectedImage;
                        }

                        _updategromming();
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
    );
  }

  void _selectImage2() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  Future<void> _updategromming() async {
    final newlist = gromminglist.value;
    final updateBox = await Hive.openBox<Gromming>('dbgroom');

    // Update the product in Hive
 await    updateBox.put(widget.id, widget.grooming);
    newlist[widget.index] = widget.grooming;
    gromminglist.value.clear();
    gromminglist.value.addAll(newlist);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    gromminglist.notifyListeners();
  }
}
