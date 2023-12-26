import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/adminpages/category/categoryfun.dart';
import 'package:savvy/adminpages/category/categoty.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:image_picker/image_picker.dart';

class Screenaddproduct extends StatefulWidget {
  const Screenaddproduct({Key? key}) : super(key: key);

  @override
  State<Screenaddproduct> createState() => _ScreenaddproductState();
}

class _ScreenaddproductState extends State<Screenaddproduct> {
 // Pdhelper pdhelp = Pdhelper();
  final TextEditingController productnameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController decripationController = TextEditingController();
  final TextEditingController quantitycontroller = TextEditingController();
  File? _selectedimage;
  final formkey = GlobalKey<FormState>();
  late Box<Category1> categorybox;
  List<Category1> category = [];
  String  ? _categoryproduct;

  String selectedvalue = '';
  Future<void> openbox() async {
    categorybox = await Hive.openBox<Category1>(dbcate);
    setState(() {
      updatecatelist();
    });
  }

  void updatecatelist() {
    setState(() {
      category = categorybox.values.toList();
    });
  }

  @override
  void dispose() {
    priceController.dispose();
    productnameController.dispose();
    decripationController.dispose();
    
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    openbox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.black),
        ),
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
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    value: _categoryproduct,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        fillColor: Color(0xABFFFEFE),
                        labelText: 'Product Category',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.black, width: double.infinity))),
                    items: category.map((Category1 category) {
                      return DropdownMenuItem<String>(
                          value: category.categoryname,
                          child: Text(category.categoryname));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _categoryproduct = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'select a category';
                      }

                      return null;
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
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      _addproduct();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add product'),
                ),
              ]),
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
    final category =_categoryproduct;

    // ignore: unused_local_variable

    final details = Product(
      image: imagepath,
      productname: name,
      price: price,
      category: category!,
      id: -1,
      decripation: description,
    );
    save1(details);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Product added successfully.'),
    ));
    // );
//   showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return AlertDialog(
//       title: Text('Success'),
//       content: Text('Product added successfully.'),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('OK'),
//         ),
//       ],
//     );
//   },
// );
  }
}
