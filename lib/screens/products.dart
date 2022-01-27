// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/datas/catagoriesItem.dart';
import 'package:portfolio/datas/dummy.dart';
import 'package:portfolio/drawer.dart';

class Products extends StatefulWidget {
  static const routeName = '/alltheItem';
  const Products({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'availableItem',
        ),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                child: Container(
                  
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.exit_to_app),
                     
                      SizedBox(
                        width: 5,
                      ),
                      Text('logOut'),
                    ],
                  ),
                ),
                value: 'logout',
              ),
            ], onChanged: (value) { 
              if(value=='logout'){
                FirebaseAuth.instance.signOut();
              
              }

             },
            
          ),
        ],
        backgroundColor: Colors.pink,
      ),
      drawer: drawer(),

      body: Container(
        color: Colors.teal,
        child: GridView(
          children: Dummy_Catagories.map(
            (catData) => CatagoryItem(
                id: catData.id, color: catData.color, title: catData.title),
          ).toList(),
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
