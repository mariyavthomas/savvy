import 'dart:io';

import 'package:flutter/material.dart';
import 'package:savvy/customerpages/gromming/booking.dart';


// ignore: must_be_immutable
class ScreenGrommingdetails extends StatefulWidget {
  ScreenGrommingdetails(
      {super.key,
      required this.imagePath,
      required this.grommingname,
      required this.price,
      required this.functionality,
      required this.time});
  Color colors = Colors.white;
  final String imagePath;
  final grommingname;
  final price;
  final functionality;
  final time;

  @override
  State<ScreenGrommingdetails> createState() => _ScreenGrommingdetailsState();
}

class _ScreenGrommingdetailsState extends State<ScreenGrommingdetails> {
  

  @override
  Widget build(BuildContext context) {
    // var details;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          widget.grommingname!,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.imagePath)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.colors == Colors.white) {
                          widget.colors = Colors.red;
                        } else {
                          widget.colors = Colors.white;
                        }
                      });
                      //  addfav_button(widget.productname,context);
                      //  print(widget.productname);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: widget.colors,
                      size: 30,
                    )),
              ),
              Center(
                child: Text(
                  widget.grommingname!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  'Rs.${widget.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 227, 110, 7)),
                ),
              ),
              SizedBox(
                height: 6,
              ),

              // Container(

              //   height: 40,
              //   decoration: BoxDecoration(border: Border.all()),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 145),
              //     child: Row(
              //               children: [

              //     IconButton(onPressed: (){
              //       setState(() {
              //        decrementQuantity();
              //       });
              //     }, icon: Icon(Icons.remove,color: Colors.black,)),
              //     SizedBox(
              //       width: 2,
              //     ),
              //     Text(
              //       quantity.toString(),
              //       style: TextStyle(fontSize: 15,color: Colors.black),

              //     ),
              //     SizedBox(height: 2),
              //     IconButton(onPressed: (){
              //       setState(() {
              //         incrementquantity();
              //       });
              //     }, icon: Icon(Icons.add,color: Colors.black,))
              //               ],
              //             ),
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'functionality',
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
              SizedBox(
                height: 19,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${widget.functionality}',
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),

          Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                      fixedSize: MaterialStatePropertyAll(Size(500, 50))),
                  onPressed: () {
                    //
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Screenbooking(
                                  imagepath: widget.imagePath,
                                  grommingname: widget.grommingname,
                                  price: widget.price,
                                  time:  widget.time,
                                )));
                  },
                  child: const Text(
                    'Book  A Groomer',
                    style: TextStyle(fontSize: 17),
                  ))),
          //  Align(
          //   alignment: Alignment.bottomLeft,
          //    child: ElevatedButton.icon(
          //                 style: ButtonStyle(
          //                   fixedSize: MaterialStatePropertyAll(Size(205,50)),
          //                     backgroundColor: MaterialStatePropertyAll(
          //                         Color.fromARGB(255, 227, 105, 5))),
          //                 onPressed: () {
          //                 // addcart(widget.grommingname!,context);
          //                 },
          //                 icon: Icon(Icons.card_travel_sharp),
          //                 label: Text('ADD TO CART',style: TextStyle(fontSize: 15),)),
          //  )
        ],
      ),
    );
  }

  // void addcart(String productname,BuildContext context)async{
  //   await Hive.openBox<Cart>('cart');
  //   final cartbox=Hive.box<Cart>('cart');
  //   final cartexists=cartbox.values.any((user) => user.name==productname);
  //   if(cartexists){
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All Ready product in Cart'),duration: Duration(seconds: 2),
  //       backgroundColor: Colors.red,));
  //   }
  //   else{
  //     final carts=Cart(
  //       id: -1,
  //       //decripation: widget.decripation,
  //       name: widget.productname!, image: widget.imagePath, price: widget.price,  quantity: quantity.toDouble()

  //     );
  //     savecart(carts);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Add to Cart SUccessfully'),duration: Duration(seconds: 2),backgroundColor: Colors.green,),);
  //   }
//  void showdata1(String name, String imagepath,  String price,
//       String category) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ScreenGrommingdetails(

//           imagePath: imagepath,

//         ),
//       ),
//     );
//   }
}
