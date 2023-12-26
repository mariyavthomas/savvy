import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:savvy/adminpages/category/addcategory.dart';
import 'package:savvy/adminpages/category/categoryfun.dart';
import 'package:savvy/adminpages/category/categoty.dart';
import 'package:savvy/adminpages/groomingsection/grommingdb/gromming.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';



class Categoryediting extends StatefulWidget {
  final category;
  final int id;
  final int index;
  

 Categoryediting(
      {super.key,
      required this.category,
      required this.index,
      required this.id,
      });

  @override
  _CategoryeditingState createState() => _CategoryeditingState();
}

class _CategoryeditingState extends State<Categoryediting> {
  final _formKey = GlobalKey<FormState>();
  //late TextEditingController _category;
  // late String _productCategory;
 CategoryHelper cate=CategoryHelper();
  late TextEditingController _categoryname;
  String? _selectedImage; // Updated to use File for selected image
  
  @override
  void initState() {
    super.initState();
    _categoryname = TextEditingController(text: widget.category.categoryname);

    
    
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
                          : (widget.category.catimage.isNotEmpty
                              ? Image.file(File(widget.category.catimage))
                              : Container()), // Show an empty container if product's image is empty
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _categoryname,
                    decoration: const InputDecoration(
                      labelText: 'Category Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Catgory name';
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

                        widget.category.categoryname = _categoryname.text;

                        
                        if (_selectedImage != null) {
                          widget.category.catimage = _selectedImage;
                        }

                      
                        setState(() {
                            _updateCategory();
                          cate.getallcategory();
                          Navigator.push(context, MaterialPageRoute(builder: (cts)=>ScreenaddCategory()));
                        });
                       // Navigator.pop(context);
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

  Future<void> _updateCategory() async {
    final newlist = categorylist.value;
    final updateBox = await Hive.openBox<Category1>(dbcate);

    // Update the product in Hive
 await    updateBox.put(widget.id, widget.category);
    newlist[widget.index] = widget.category;
    categorylist.value.clear();
    categorylist.value.addAll(newlist);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    categorylist.notifyListeners();
  }
}
