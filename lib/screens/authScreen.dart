import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/itemsare.dart';
import 'package:portfolio/screens/products.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? errorMessage;

  final _auth = FirebaseAuth.instance;
  //File? image;
  Future<void> submitFn(
    String mails,
    String usernames,
    String password,
    bool islogin,
    BuildContext ctx,
    //var image,
  ) async {
    UserCredential authresult;
    try {
      if (islogin) {
        authresult = await _auth.signInWithEmailAndPassword(
            email: mails, password: password);
        Navigator.of(context).pushReplacementNamed(Products.routeName);
      } else {
        authresult = await _auth.createUserWithEmailAndPassword(
            email: mails, password: password);
        //final ref = FirebaseStorage.instance
        //    .ref()
          //  .child('userimage')
       //     .child(authresult.user!.uid + '.jpg');
        // UploadTask uploadTask = ref.putFile(image!);
        // var downurl = await (await uploadTask).ref.getDownloadURL();
        // var url=downurl.toString();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authresult.user!.uid)
            .set({
          'email': mails,
          'name': usernames,
        });
        Navigator.of(context).pushReplacementNamed(Products.routeName);
      }
    } on FirebaseException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemsAre(
        submitFn,
      ),
    );
  }
}
