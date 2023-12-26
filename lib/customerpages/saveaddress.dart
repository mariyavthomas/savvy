import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/customerpages/addaddress.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/addressdb/addressfunction.dart';
import 'package:savvy/customerpages/addressedit.dart';
import 'package:savvy/customerpages/buy.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';

class Screenaddress extends StatefulWidget {
  const Screenaddress({Key? key, required this.address}) : super(key: key);

  final String address;

  @override
  State<Screenaddress> createState() => _ScreenaddressState();
}

class _ScreenaddressState extends State<Screenaddress> {
  AddressHel add = AddressHel();
  late Box<Address> addressbox = Hive.box('address');

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
                valueListenable:
                    addresslist, // Make sure addresslist is defined
                builder: (context, List<Address> addresslist, Widget? child) {
                  return ListView.builder(
                    itemCount: addresslist.length,
                    itemBuilder: (context, index) {
                      final address = addresslist[index];

                      return Stack(
                        children:[ 
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            width: double.infinity,
                           // height: 150,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Column(
                             // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${address.addname}"),
                                Text("${address.housename}"),
                                Text("${address.post}"),
                                Text("${address.dis}"),
                                Text("${address.pincode}"),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      onPressed: () {
                                        print(address.id);
                                        add.delete1(address.id);
                                        setState(() {
                                          addresslist.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 200),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdressEditingPage(address: address,id: address.id,index: index,)));
                                        }, icon: Icon(Icons.edit)),
                                  )
                                ])
                              ],
                            ),
                            
                                                  ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 560),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                             style: ButtonStyle( fixedSize: MaterialStatePropertyAll(Size(450,45))), 
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPaymentScreen(address: address,index: index,totelPrice: totals)));
                              }, child: Text('Payment'))),
                        )
          ]);
                    
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
