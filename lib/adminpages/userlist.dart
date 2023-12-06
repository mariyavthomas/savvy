
import 'package:flutter/material.dart';

//import 'package:hive_flutter/hive_flutter.dart';

import 'package:savvy/customerpages/user%20database/logindatabase.dart';
import 'package:savvy/customerpages/user%20database/userfunction.dart';

class Userlist extends StatefulWidget {
  const Userlist({super.key});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  
 
  @override
  void initState() {
    super.initState();
   getall3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [IconButton(onPressed:

        // , icon: Icon(Icons.refresh,color: Colors.black,))],
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: Text(
          'List of User',
          style: TextStyle(color: Colors.black),
        ),
        
      ),
      body: ValueListenableBuilder(
        valueListenable: userlist,
        builder: (context, List<User> userslist, Widget? child) {
          return ListView.builder(
            itemCount: userslist.length,
            itemBuilder: (context, index) {
              final user = userslist[index];
              // final imagePath = gromming.image;

              return Column(
                children: [
                  Card(
                    
                    elevation: 10,
                    child: ListTile(
                      leading: Column(
                        
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 160),
                            child: Text("${user.name}"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 140),
                            child: Text("${user.number}"),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("${user.email}"),
                          ),

                        ],
                        
                      ),

                    ),
                    
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
              
            },
          );
        },
      ),
    );
  }
}
