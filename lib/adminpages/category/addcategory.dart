import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savvy/adminpages/category/categoryfun.dart';
import 'package:savvy/adminpages/category/categoty.dart';


import 'package:image_picker/image_picker.dart';
import 'package:savvy/adminpages/category/editcategory.dart';

class ScreenaddCategory extends StatefulWidget {
  const ScreenaddCategory({Key? key}) : super(key: key);

  @override
  State<ScreenaddCategory> createState() => _ScreenaddCategoryState();
}

class _ScreenaddCategoryState extends State<ScreenaddCategory> {
 
  final TextEditingController catenamenameController = TextEditingController();
  
  CategoryHelper cate=CategoryHelper();
  File? _selectedimage;
  final formkey = GlobalKey<FormState>();
  
  @override
  void initState() {
   
    super.initState();
     cate.getallcategory();
    // Future.delayed(Duration(microseconds: 1),(){set();});
    // print('podee');
    
  }

  set(){
    setState(() {
      
    });
  }

  @override
  void dispose() {
    catenamenameController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
    cate.getallcategory();
  });
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Add Category',style: TextStyle(color: Colors.black),),
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
        child: Column(
          children: [
            SafeArea(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _selectimage,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: ClipRRect(
                          
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                           width: 150,
                           height:150 ,
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
                                    Icons.add_a_photo_outlined,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
        
                        controller: catenamenameController,
                       // autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          labelText: "Category Name",
                          fillColor: Color(0xABFFFEFE),
                          
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Category name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          catenamenameController.text = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                   
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () async {
                        
                          if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          setState(() {
                             _addcategory();
                          _selectedimage=null;
                          catenamenameController.clear();
                          });
                         
                                                  //Navigator.of(context).pop();
                        }
                        
                        // if (formkey.currentState!.validate()) {
                        //   formkey.currentState!.save();
                          
                        //   _addcategory();
                        //   //Navigator.of(context).pop();
                        // }
                      },
                      child: Text('Add Category'),
                      
        
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              
              child: ValueListenableBuilder(
          valueListenable: categorylist,
          builder: (context, List<Category1> categorylist, Widget? child) {
            return ListView.builder(
         
            //physics: TransparentScrollPhysics(),
              itemCount: categorylist.length,
              itemBuilder: (context, index) {
                final category = categorylist[index];
                final imagePath = category.catimage;
            
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    startActionPane:
                        ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Color.fromARGB(255, 246, 99, 31),
            label: 'Delete',
            autoClose: true,
            icon: Icons.delete,
            
            onPressed: (context) {
        
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Deletion"),
              content: Text("Are you sure you want to delete this item?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    cate.delete(category.id);
                    Navigator.of(context).pop(); 
                   
                    // Close the dialog after deletion
                  },
                  child: Text("Delete"),
                 
                ),
                
              ],
            );
          },
        );
            },
          ),
        ],
        ),
                    endActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                          backgroundColor: Colors.green,
                          label: 'Edit',
                          // ignore: deprecated_member_use
                          icon: FontAwesomeIcons.edit,
                          autoClose: true,
                          onPressed: (context) {
                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                
                                builder: (context) => Categoryediting(
                                  category: category,
                                  index: index,
                                  id: category.id,
                                ),
                              ),
                            );
                          })
                    ]),
                    child: Card(
                      child: Container(
                        
                        width: double.infinity,
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 149,
                                height: 100,
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
                              left: 180,
                              top: 40,
                              child: Text("${category.categoryname}",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)
                            ),
                           
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
            )
          ],
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

  void _addcategory() async {
    if (_selectedimage == null) {
      return;
    }
    final imagepath = _selectedimage!.path;
    final name = catenamenameController.text;
   
    
    // ignore: unused_local_variable
    
    final details = Category1(
      categoryname: name,
      catimage: imagepath,
      id: -1
      
      
    );
   cate.save(details);
    
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Product added successfully.'),
    ));
  
  }
}

