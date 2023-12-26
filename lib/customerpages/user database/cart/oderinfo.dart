import 'package:flutter/material.dart';
import 'package:savvy/customerpages/user%20database/cart/cartcustomwidget.dart';

class orderinfo extends StatefulWidget {
  orderinfo(
      {required this.imgs,
      required this.name,
      required this.color,
      required this.qnty,
      required this.rate,
      required this.usern,
      required this.mail,
      required this.address,
      required this.city,
      required this.pin,
      super.key});
  final imgs;
  final String name;
  final color;
  final qnty;
  final rate;
  final usern;
  final mail;
  final address;
  final pin;
  final city;
  @override
  State<orderinfo> createState() => _OrderfillscreenState();
}

class _OrderfillscreenState extends State<orderinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Order',
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          customecart(
              image: widget.imgs,
              productname: widget.name,
              decripation: widget.address,
              quantity: widget.qnty,
              price: widget.rate),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item tottal'),
                Text(
                  '₹${widget.rate}',
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
                  '₹${widget.rate}',
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
                Text('Name: '),
                SizedBox(
                  width: 20,
                ),
                Text(widget.usern)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              children: [
                Text('Number: '),
                SizedBox(
                  width: 20,
                ),
                Text(widget.mail)
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
                      child: Center(child: Text(widget.address))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'City: ${widget.city}',
                    ),
                    Text('Pin Code: ${widget.pin}')
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
