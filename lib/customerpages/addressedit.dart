// import 'dart:convert';

import 'package:savvy/controller/user.controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/addressdb/addressfunction.dart';

class AdressEditingPage extends StatefulWidget {
  final Address ?address;
  final int? id;
  final int ?index;

   AdressEditingPage(
      {Key? key, this.address,  this.index,  this.id})
      : super(key: key);

  @override
  _AdressEditingPageState createState() => _AdressEditingPageState();
}

class _AdressEditingPageState extends State<AdressEditingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _addname;
  late TextEditingController _housename;
  late TextEditingController _pincode;
  late TextEditingController _dis;
  late TextEditingController _post;

  @override
  void initState() {
    super.initState();
    _addname = TextEditingController(text: widget.address?.addname);
    _housename = TextEditingController(text: widget.address?.housename);
    _pincode = TextEditingController(text: widget.address?.pincode);
    _post = TextEditingController(text: widget.address?.post);
    _dis = TextEditingController(text: widget.address?.dis);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Edit your Address',style: TextStyle(color: Colors.black),),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _addname,
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _housename,
                    decoration: const InputDecoration(
                      labelText: 'Housename',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a hosename';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _pincode,
                    decoration: const InputDecoration(
                      labelText: 'Pincode',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a pincode';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid pincode';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _post,
                    decoration: const InputDecoration(
                      labelText: 'Post',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Post ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _dis,
                    decoration: const InputDecoration(
                      labelText: 'District',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a District';
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

                        widget.address?.addname = _addname.text;
                        widget.address?.housename = _housename.text;
                        widget.address?.pincode = _pincode.text;
                        widget.address?.post = _post.text;
                        widget.address?.dis = _dis.text;

                        _updateProduct();
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

  Future<void> _updateProduct() async {
    final newlist = addresslist.value;
    final updateBox = await Hive.openBox<Address>(dbname);

    // Update the product in Hive
    await updateBox.put(widget.id, widget.address!);
    newlist[widget.index!] = widget.address!;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    addresslist.notifyListeners();
  }
}
