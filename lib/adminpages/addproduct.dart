import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:image_picker/image_picker.dart';

class Screenaddproduct extends StatefulWidget {
  const Screenaddproduct({Key? key}) : super(key: key);

  @override
  State<Screenaddproduct> createState() => _ScreenaddproductState();
}

class _ScreenaddproductState extends State<Screenaddproduct> {
  Pdhelper pdhelp = Pdhelper();
  final TextEditingController productnameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController decripationController = TextEditingController();
  final TextEditingController quantitycontroller=TextEditingController();
  File? _selectedimage;
  final formkey = GlobalKey<FormState>();
  final List<String> category = [
    'Dry Food',
    'Wet Food',
    'Grain Free Food',
    'Puppy Food',
    'Adult Food',
    'Vegetarian Food'
  ];
  String selectedvalue = '';

  @override
  void dispose() {
    priceController.dispose();
    productnameController.dispose();
    decripationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: formkey,
              child: Column(
                children: [
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
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Select Category',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                      items: category.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedvalue = item;
                                  });
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      if (selectedvalue == item)
                                        const Icon(Icons.check_box_outlined)
                                      else
                                        const Icon(Icons.check_box_outline_blank),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                      value: selectedvalue.isNotEmpty ? selectedvalue : null,
                      onChanged: (value) {
                        setState(() {
                          selectedvalue = value!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: productnameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: "Product Name",
                        fillColor: Color(0xABFFFEFE),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        productnameController.text = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: priceController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'Product Price',
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
                        
                        maxLines: 5,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: decripationController,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          fillColor: Color(0xABFFFEFE),
                          border: OutlineInputBorder(
                            //borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          decripationController.text = value!;
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
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        _addproduct();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add product'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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

  void _addproduct() async {
    if (_selectedimage == null) {
      return;
    }
    final imagepath = _selectedimage!.path;
    final name = productnameController.text;
    final price = priceController.text;
    final description = decripationController.text;
    final category = selectedvalue;
    
    
    // ignore: unused_local_variable
    
    final details = Product(
      image: imagepath,
      productname: name,
      price: price,
      category: category,
      id: -1,
      decripation: description,
      
    );
    pdhelp.save1(details);
  }
}

// Future<void> getall() async {
//   final save1 = await Hive.openBox<Product>(dbname);
// }
