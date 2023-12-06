import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:savvy/customerpages/addaddress.dart';
import 'package:savvy/customerpages/addressdb/address.dart';
import 'package:savvy/customerpages/addressdb/addressfunction.dart';

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
      ),
      body: Column(
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
            title:
                const Text('Add Address', style: TextStyle(color: Colors.blue)),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: addresslist, // Make sure addresslist is defined
              builder: (context, List<Address> addresslist, Widget? child) {
                return ListView.builder(
                  itemCount: addresslist.length,
                  itemBuilder: (context, index) {
                    final address = addresslist[index];

                    return Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Text("${address.addname}"),
                          Text("${address.housename}"),
                          Text("${address.post}"),
                          Text("${address.dis}"),
                          Text("${address.pincode}"),
                          IconButton(
                            onPressed: () {
                              print(address.id);
                              add.delete1(address.id);
                              setState(() {
                                addresslist.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
