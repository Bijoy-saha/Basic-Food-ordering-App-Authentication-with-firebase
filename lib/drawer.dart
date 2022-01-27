// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/models/imagesection.dart';
import 'package:portfolio/screens/products.dart';
import 'package:url_launcher/url_launcher.dart';

class drawer extends StatelessWidget {
  void shifting(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Products.routeName);
  }

  void pro(BuildContext context) {
  }

  // ignore: prefer_final_fields
  String _url = 'https://www.facebook.com/';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.pinkAccent,
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(height: 28),
                  ImageTaking(),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.restaurant_menu,
              size: 25,
            ),
            title: Text(
              'Items!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            onTap: () => shifting(context),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(
              'Your profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.facebook,
              size: 20,
            ),
            title: GestureDetector(
              child: Text(
                'Visit Our FacebookPage',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            onTap: _launchURL,
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
