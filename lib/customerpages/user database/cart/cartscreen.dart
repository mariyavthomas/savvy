
import 'package:flutter/material.dart';
import 'package:savvy/customerpages/productdetails.dart';

import 'package:savvy/customerpages/user%20database/cart/cart.dart';
import 'package:savvy/customerpages/user%20database/cart/cartfunction.dart';

import 'cartcustomwidget.dart';



late double totals;

class cartscreens extends StatefulWidget {
  const cartscreens({super.key});

  @override
  State<cartscreens> createState() => _cartscreensState();
}

class _cartscreensState extends State<cartscreens> {
  @override
  void initState() {
    super.initState();
    getallcart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Cart',style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,),
      
      body:
       Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: addcartlist,
              builder: (context, List<Cart> addcartlist, Widget? child) {
                //print("Cart List: $addcartlist");
                return ListView.builder(
                  itemCount: addcartlist.isEmpty ? 1 : addcartlist.length,
                  itemBuilder: (context, index) {
                    if (addcartlist.isEmpty) {
                      return Column(
                        children: [
                          Center(
                              child: Container(
                                child: Center(child: Text('Empty')),
                          )),
                        ],
                      );
                    }
                    final Cart = addcartlist[index];
                    return Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customecart(
                                image: Cart.image,
                                productname: Cart.name,
                                decripation: Cart.name,
                                price: Cart.price,
                                quantity: Cart.quantity.toString(),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 110,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              countLessing(
                                                idd: Cart.id,
                                                imagee: Cart.image,
                                                pricee: int.parse(Cart.price),
                                                quantityy: Cart.quantity,
                                                titlee: Cart.name,
                                                
                                              );
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          qunditys(Cart.quantity).toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 2),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              countAdding(
                                                idd: Cart.id,
                                                imagee: Cart.image,
                                                pricee: int.parse(Cart.price),
                                                quantityy: Cart.quantity,
                                                titlee: Cart.name,
                                                
                                              );
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                 
                                  Text('₹${Cart.price}')
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 190,
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  onTap: () {
                                     deleteCart(Cart.id!);
                                  },
                                  title: Text('Delete'),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 10,
                              ),
                              Container(
                                width: 160,
                                child: ListTile(
                                  onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Screenpdetails(productname: Cart.name, price: Cart.price, decripation: Cart.name, imagePath: Cart.image!,)));
                                  },
                                  leading: Icon(Icons.shop_2),
                                  title: Text('Buy Now'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price'),
                  ValueListenableBuilder(
                    valueListenable: addcartlist,
                    builder: (context, List<Cart> addcartlist, Widget? child) {
                      final Carts = addcartlist.toList();
                      double totalPrice = 0.0;
                      for (var item in Carts) {
                        final price = double.parse(item.price);
                        final qnty = item.quantity;

                        totalPrice += price * qnty;
                        totals = totalPrice;
                      }
                      return Text('₹${totalPrice.toStringAsFixed(2)}');
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                   
                     },
                    child: Text('Place Order'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 238, 215, 99))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int qunditys(double qunditys) {
    int? qnty = qunditys.toInt();
    return qnty;
  }

  Future<void> countLessing(
      {quantityy, pricee, titlee, imagee, idd, cate}) async {
    int id = idd ?? 0;
    double quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (quantity > 1) {
      quantity = quantity - 1;

      final cart = Cart(
        //decripation: title,
        id: id,
        quantity: quantity.toDouble(),
        name: title,
        price: price.toString(),
        image: image,
      );
      await upgadecart(id, cart);
    }
  }

  Future<void> countAdding(
      {quantityy, pricee, titlee, imagee, idd, cate}) async {
    int id = idd ?? 0;
    double quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (quantity < 9) {
      quantity = quantity + 1;

      final cart = Cart(
        
        id: id,
        quantity: quantity.toDouble(),
        name: title,
        price: price.toString(),
        image: image,
      );
      await upgadecart(id, cart);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product out of stock'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  void showdatacarttodetail(String name, String imagepath,  String price,String discrp,
      String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screenpdetails(
          productname: name,
          
          imagePath: imagepath,
           price: price,
          decripation: discrp,
         
        ),
      ),
    );
  }
  

}