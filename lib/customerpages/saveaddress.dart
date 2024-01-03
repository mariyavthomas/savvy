import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/customerpages/addaddress.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/addressdb/addressfunction.dart';
import 'package:savvy/customerpages/buy.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';

import 'addressedit.dart';


class Screenaddress extends StatefulWidget {
  //final int index=0;
  final int totals;
  const Screenaddress({Key? key, required this.address,required this.totals}) : super(key: key);

  final String address;

  @override
  State<Screenaddress> createState() => _ScreenaddressState();
}

class _ScreenaddressState extends State<Screenaddress> {
  AddressHel add = AddressHel();
  late Box<Address> addressbox = Hive.box('address');
  int?selectaddress;

  @override
  void initState() {
    super.initState();
    add.getalll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: const Text(
          'Save Address',
          style: TextStyle(color: Colors.black),
        ),
        actions: [IconButton(onPressed: (){
          setState(() {
            
          });
        }, icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Screenaddaddress()),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.blue),
              ),
              title: const Text('Add Address',
                  style: TextStyle(color: Colors.blue)),
            ),
            Expanded(
              child: ValueListenableBuilder(
            valueListenable: addresslist,
            builder: (context, List<Address> address, Widget? child) {
              return ListView.separated(
                itemCount: address.length,
                itemBuilder: (BuildContext context, int index) {
                  final addressadd = address.reversed.toList()[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle address tap
                          _handleRadioValueChange(index, addressadd);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Radio(
                                value: index,
                                groupValue: selectaddress,
                                onChanged: (int? value) {
                                  // Handle Radio button change

                                  _handleRadioValueChange(value, addressadd);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    addressadd.addname,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    addressadd.housename,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(addressadd.dis),
                                  Text(addressadd.pincode),
                                   Text(addressadd.post),
                                    Text(addressadd.mail),
                                    Text(addressadd.number),

                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => AdressEditingPage(
                                                    
                                                    )));
                                      },
                                      icon: Icon(Icons.edit)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  // You can customize the appearance of the separator here
                  return Divider(
                    height: 1,
                    color: Colors.grey,
                  );
                },
              );
            },
          ),
        ),
    ]  ),
     ) );
  }

  // Update the Radio onChanged callback
  void _handleRadioValueChange(int? value, Address selectedAddress) {
    setState(() {
      selectaddress = value;

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (buy) => CartPaymentScreen(
                    address: selectedAddress,
                    totels: totals,
                    
                  
                  )));
    });
  }
}