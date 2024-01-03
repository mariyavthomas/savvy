import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:savvy/customerpages/user%20database/cart/oderdetailsperproduct.dart';

import 'order.dart';
import 'orderfunction.dart';

class orderhistory extends StatefulWidget {
  const orderhistory({super.key});

  @override
  State<orderhistory> createState() => _orderhistoryState();
}

int totelPriceShare = 0;

class _orderhistoryState extends State<orderhistory> {
//carthHelper chp = carthHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: orderhistoryNotify,
              builder: (BuildContext context,
                  List<OrderhistoryModel> cartorderlist, Widget? child) {
                if (cartorderlist.isEmpty) {
                  return  Center(
                      child:  Container(
                          child: Lottie.asset(
                            'assets/image/cartemty.json',
                          ),
                        ),
                      );
                }
                return ListView.builder(
                  itemCount: cartorderlist.length,
                  itemBuilder: (context, index) {
                    final data = cartorderlist[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ValueListenableBuilder(
                        valueListenable: orderhistoryNotify,
                        builder: (context, box, child) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => orderinfo(
                                            imgs: data.image,
                                            productname: data.productname,
                                            decripation: data.decripation,
                                            username: data.usrname,
                                            pin: data.pincode,
                                            housename:data.housename,
                                            dis:data.dis ,

                                            mail: data.mail,
                                            mobile: data.mobile,
                                            post: data.post,
                                            qnty: data.quantity.toString(),
                                            price: data.price.toString(),
                                            
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12,bottom: 8,right: 12,top: 8),
                              child: Card(
                                
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 88,
                                          child: AspectRatio(
                                            aspectRatio: 0.88,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                child: Image(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      FileImage(File(data.image)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 1),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(height: 15),
                                              Text(
                                                data.productname,
                                              ),
                                             
                                              Text(
                                                'Quandity :${data.quantity.toString()}',
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 65, 65, 65),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Total Price: ₹${totals(data.quantity!, data.price)}',
                                                    style: const TextStyle(
                                                      // fontWeight: FontWeight.w500,
                                                      // color: Colors.green,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                    ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Order Cancelation',
                                              ),
                                              content: Text(
                                                  'You Want cancel this product'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        cartorderlist
                                                            .removeAt(index);
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Yes')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('No'))
                                              ],
                                            );
                                          },
                                        );
                                        setState(() {});
                                      },
                                      leading: Icon(Icons.cancel),
                                      title: Text(
                                        'Cancelation',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  void showDailogealert(BuildContext context, String val) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Order Cancelation',
          ),
          content: Text('Reason: ${val}'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      },
    );
  }

  String totals(double qnty, num price) {
    num val = qnty * price;
    String tot = val.toString();
    return tot;
  }
}
