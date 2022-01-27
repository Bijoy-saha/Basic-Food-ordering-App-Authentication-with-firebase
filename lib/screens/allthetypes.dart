// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AllType extends StatelessWidget {
  final String id;
  final String imageurl;
  final String title;
  final int duration;
  final List<String> ingredirens;
  AllType(this.imageurl, this.title, this.duration, this.ingredirens, this.id);
  void tapping(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tapping(context),
      child: Card(
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.network(
                imageurl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: Container(
                height: 30,
                color: Colors.black54,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
