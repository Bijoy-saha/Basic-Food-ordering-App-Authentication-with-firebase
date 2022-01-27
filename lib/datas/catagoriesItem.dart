import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CatagoryItem extends StatelessWidget {
  final String title;
  Color color;
  String id;
  // ignore: use_key_in_widget_constructors
  CatagoryItem({required this.id, required this.color, required this.title});

  void select(BuildContext context) {
    Navigator.of(context).pushNamed('/here are items', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => select(context),
        child: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              title,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, color, Colors.black54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
