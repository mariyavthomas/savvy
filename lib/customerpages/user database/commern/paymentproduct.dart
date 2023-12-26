import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:savvy/adminpages/database/product.dart';
import 'package:savvy/controller/user.controller.dart';
import 'package:savvy/customerpages/user%20database/cart/cartscreen.dart';


class Paymentproduct extends StatefulWidget {
  final dynamic totelPrice;
  final int index;
  Paymentproduct({
    required this.address,
    super.key,
    required this.index,
    required this.totelPrice, 
  });
  final address;
  @override
  State<Paymentproduct> createState() => _PaymentproductState();
}

class _PaymentproductState extends State<Paymentproduct> {
  String method = 'val';
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  String groupValue = 'Yes';
  bool? allow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Payment',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: ValueListenableBuilder(
        valueListenable: productlist,
         builder:(context,List<Product>productlist,Widget?child){

          final product = productlist;
         
       
        return ListView(
          children: [
            const SizedBox(height: 10),
      
            ListTile(
              leading: Radio(
                  value: 'Now',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
              title: const Text('UPI'),
              trailing: const SizedBox(
                width: 100,
              ),
            ),
      
            ListTile(
              leading: Radio(
                  value: 'Now1',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
              title: const Text('Credit/Debit/ATM Card'),
              subtitle:
                  const Text('Add and secure your card as per RBI quidelines'),
            ),
            ListTile(
              leading: Radio(
                  value: 'Now2',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
              title: const Text('Net Banking'),
            ),
            ListTile(
              leading: Radio(
                  value: 'Now3',
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
              title: const Text('Cash on Delivery'),
            ),
      
      
      
           Row(
             children: [
       
        //Text('₹${product.price}'),
                
               ElevatedButton(onPressed: (){}, child: Text('Pay')),
             ],
           )
            //CartPayDelCard(widget: widget, allow: allow),
            // Paymentproduct(
            //   address: widget.address,
            //   allow: allow,
            //   widget: widget,
            //   groupValue: groupValue, index: widget.index, totelPrice: totals,
            // ),
          ],
        );
   } ),
    );
  }
}
