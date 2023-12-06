import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:savvy/customerpages/addressdb/address.dart';

import 'addressdb/addressfunction.dart';

class Screenaddaddress extends StatefulWidget {
  const Screenaddaddress({super.key});

  @override
  State<Screenaddaddress> createState() => _ScreenaddaddressState();
}

class _ScreenaddaddressState extends State<Screenaddaddress> {
  AddressHel addr=AddressHel();
  bool isPinCode(String input) =>
    RegExp(r'^[1-9]\d{2}\s?\d{3}$').hasMatch(input);

  bool isEmail(String input) => EmailValidator.validate(input);
   final TextEditingController  addnameController=TextEditingController();
   final TextEditingController housenameController=TextEditingController();
   final TextEditingController pincodeController=TextEditingController();
   final TextEditingController postController =TextEditingController();
   final TextEditingController disController=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  void dispose() {
    addnameController.dispose();
    housenameController.dispose();
    pincodeController.dispose();
    postController.dispose();
    disController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,

        title:const Text('Add address',style: TextStyle(color: Colors.black),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.save))],
      ),
      body:  Center(
        child: Card(
          elevation: 20,
          child: Container(
            width: 360,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                   
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a address name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addnameController.text = value!;
                      },
                      controller: addnameController,
                      decoration: InputDecoration(
                          labelText: "Username",
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
                        housenameController.text = value!;
                      },
                      controller: housenameController,
                      decoration: InputDecoration(
                          labelText: "House Name",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter House Name",
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
                      controller:pincodeController,
                      decoration: InputDecoration(
                          labelText: "PIN Number",
                          labelStyle: TextStyle(
                              color:Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter your Pin Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.mobile_friendly,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!isPinCode(value!)) {
                          return 'Please Enter Valid Number';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        pincodeController.text = value!;
                      },
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
                        postController.text = value!;
                      },
                      controller: postController,
                      decoration: InputDecoration(
                          labelText: "Post of office",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter Post",
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
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        disController.text = value!;
                      },
                      controller: disController,
                      decoration: InputDecoration(
                          labelText: "District",
                          labelStyle: TextStyle(
                              color: Colors.grey,
                             // fontWeight: FontWeight.w800
                              ),
                          hintText: "Enter District",
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
                      height: 20,
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
                        addaddress();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add Address'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void addaddress() async {
    
    
    // ignore: unused_local_variable
    final addname = addnameController.text;
    final housename = housenameController.text;
    final pincode=pincodeController.text;
    final post=postController.text;
    final dis=disController.text;
    final details = Address(
     addname: addname,
     housename: housename,
     pincode: pincode,
     post: post,
     dis: dis,
     id:-1
    );
    addr.save(details);
  }
}