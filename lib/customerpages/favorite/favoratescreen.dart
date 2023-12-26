
import 'package:flutter/material.dart';

import 'package:savvy/customerpages/favorite/favorite.dart';
import 'package:savvy/customerpages/favorite/favoritefunctions.dart';

import 'curomwidgetproduct.dart';

//Color colorss = Colors.red;

class favourts extends StatefulWidget {
  const favourts({super.key});

  @override
  State<favourts> createState() => _favourtsState();
}

class _favourtsState extends State<favourts> {
  //late Box<Favorite> wishBox = Hive.box<Favorite>('fav');
  // wishHelper whp = wishHelper();

  @override
  void initState() {
    super.initState();
  getallfav();
  }

  // Future<void> _openBox() async {
  //   wishBox = await Hive.openBox<Favorite>('fav');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Wish list',
            
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: favoritelist,
              builder: (context,List<Favorite>favoritelist,Widget?child ) {
                final values = favoritelist;
                if (values.isEmpty) {
                  return Column(
                    children: [
                      // Center(
                      //   child: Image.asset('images/wishlist.gif'),
                      // ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: favoritelist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 3, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final vals = values.reversed.toList()[index];
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => productdetials(
                                    //         pdname: vals.name,
                                    //         imagesp: vals.image,
                                    //         rate: vals.price,
                                    //         color: vals.cate,
                                    //         discriptions: vals.disc,
                                    //       ),
                                    //     ));
                                  },
                                  child: customeproduct(
                                      image: vals.image,
                                      productname: vals.productname,
                                      price: vals.price),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 120,
                                top: 25,
                                child: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text('Remove from wish list'),
                                      backgroundColor: Colors.red,
                                    ));
                                    //favoritelist.deleteAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.favorite),
                                  iconSize: 35,
                                  //color: colorss,
                                )),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ));
  }
}