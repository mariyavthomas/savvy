//import 'package:casa_example/color.dart';

import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:savvy/adminpages/addproduct.dart';
import 'package:savvy/customerpages/user%20database/logindatabase.dart';
import 'package:savvy/customerpages/user%20database/userfunction.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}


class _signinState extends State<signin> {

   bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  bool isEmail(String input) => EmailValidator.validate(input);
  String? _selectedImage;
  final picker = ImagePicker();
  final _RegisterKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.black),
       leading: IconButton(onPressed: () {
         Navigator.pop(context);
       },icon: Icon(Icons.arrow_back),),
        title: Text("Create Account",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor:   Color.fromRGBO(58, 175, 169, 1),
        ),
      body: Center(
        child: Card(
          elevation: 20,
          child: Container(
            width: 360,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _RegisterKey,
                child: ListView(
                  children: [
                    InkWell(
                      onTap: _selectImage1,
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor:  const Color.fromARGB(255, 201, 200, 200),
                        backgroundImage: _selectedImage != null
                            ? FileImage(File(_selectedImage!))
                            : null,
                        child: _selectedImage == null
                            ? Image.asset('assets/image/person.png')
                            : null,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a address name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        usernamecontroller.text = value!;
                      },
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                          labelText: "UserName",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter UserName",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        passcontroller.text = value!;
                      },
                      controller: passcontroller,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: numcontroller,
                      decoration: InputDecoration(
                          labelText: "Mobile number",
                          labelStyle: TextStyle(
                              color:Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter your number",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.mobile_friendly,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!isPhone(value!)) {
                          return 'Please Enter Valid Number';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        numcontroller.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: mailcontroller,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                            //  fontWeight: FontWeight.w300
                              ),
                          hintText: "Enter Your Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.mail,
                            color:Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (!isEmail(value!)) {
                          return 'Please Enter Valid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        numcontroller.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(12),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(58, 175, 169, 1),
                            )),
                        onPressed: () {
                          if (_selectedImage != null) {
                            if (_RegisterKey.currentState!.validate()) {
                              signup(
                                  mailcontroller.text,
                                  passcontroller.text,
                                  context,
                                  usernamecontroller.text,
                                  numcontroller.text,
                                  _selectedImage!);
                              _RegisterKey.currentState!.save();
                              usernamecontroller.text = '';
                              mailcontroller.text = '';
                              passcontroller.text = '';
                              numcontroller.text = '';
                              _selectedImage = null;
                              setState(() {});
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Alert'),
                                  content: const Text('Please Select Image'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Text( 'Sign Up'),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectImage1() async {
    final selectedimg1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedimg1 != null) {
      setState(() {
        _selectedImage = selectedimg1.path;
      });
    }
  }

  void signup(String email, String password, BuildContext context, String name,
      String number, String imgpath) async {
    // await Hive.initFlutter(); // Initialize Hive
    await Hive.openBox<User>('users'); // Open the Hive box for users

    final usersBox = Hive.box<User>('users');

    final userExists = usersBox.values.any((user) => user.email == email);
    if (userExists) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('User already exists'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      if (email == 'admin@gmail.com') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text('This Mail Not Allowed For Users'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        final user = User(
            image: imgpath,
            email: email,
            password: password,
            name: name,
            number: number,
            id: -1);
        usersBox.add(user);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Account created successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        getall3();
      }
    }
  }

  
}