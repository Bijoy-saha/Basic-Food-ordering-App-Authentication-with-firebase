import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/lastvai.dart';
import 'package:portfolio/screens/authScreen.dart';
import 'package:portfolio/screens/detailsscreen.dart';

// ignore: unused_import
import 'package:portfolio/screens/itemsare.dart';
import 'package:portfolio/screens/products.dart';
import 'package:portfolio/screens/pvtry.dart';
import 'package:portfolio/screens/selectedItem.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Products();
          }
          return AuthScreen();
        },
      ),

      // ignore: prefer_const_literals_to_create_immutables
      routes: {
        SelectedItem.routeName: (context) => SelectedItem(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        // ignore: prefer_const_constructors
        Products.routeName: (context) => Products(),
        lasttt.routeName: (context) => lasttt(),
        //Expanses.routeName: (context) =>Expanses(),
      },
    );
  }
}
