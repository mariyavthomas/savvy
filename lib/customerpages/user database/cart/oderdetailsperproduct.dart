import 'package:flutter/material.dart';

import 'cartcustomwidget.dart';

class orderinfo extends StatefulWidget {
  orderinfo(
      {required this.imgs,
      required this.productname,
      required this.qnty,
      required this.price,
      required this.username,
      required this.mail,
      required this.housename,
      required this.pin,
      required this.decripation,
      required this.dis,
      required this.mobile,
      required this.post,
      super.key});
  final imgs;
  final String productname;
  final qnty;
  final price;
  final username;
  final mail;
  final decripation;
  final pin;
  final housename;
  final post;
  final dis;
  final mobile;

  @override
  State<orderinfo> createState() => _OrderfillscreenState();
}

class _OrderfillscreenState extends State<orderinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Order details',style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          customecart(
            image: widget.imgs,
            productname: widget.productname,
            //colorss: widget.color,
            quantity: widget.qnty,
            price: widget.price,
            decripation: widget.decripation,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item tottal'),
                Text(
                  '₹${widget.price}',
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery fee',
                ),
                Text(
                  'Free',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                ),
                Text(
                  '₹${widget.price}',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                Text('Name: ${widget.username}'),
                SizedBox(
                  width: 20,
                ),
                //Text( widget.usern)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                Text('Number: ${widget.mobile}'),
                SizedBox(
                  width: 20,
                ),
                //Text(widget.mail)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Address:'),
                Card(
                  elevation: 15,
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Center(
                          child: Column(
                        children: [
                          Text(widget.username),
                          Text(widget.housename),
                          Text(widget.pin),
                          Text(widget.post),
                          Text(widget.dis),
                          Text(widget.mobile),
                          Text(widget.mail)
                          

                        ],
                      ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //  'City: ${widget.city}',
                    // ),
                    //Text( 'Pin Code: ${widget.pin}')
                  ],
                ),
                Divider(),
                Text('Payment methode:'),
                Card(
                  child: ListTile(
                    title: Text('Cash On Delivery'),
                    trailing: Icon(Icons.expand_more),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
