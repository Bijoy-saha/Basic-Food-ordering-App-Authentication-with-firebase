// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/datas/dummy.dart';
import 'package:portfolio/drawer.dart';
import 'package:portfolio/screens/allthetypes.dart';

class SelectedItem extends StatelessWidget {
  static const routeName = '/here are items';

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // ignore: unused_local_variable
    final catagoryid = args['id'];
    // ignore: unused_local_variable
    final catagorytitle = args['title'];
    // ignore: unused_local_variable
    final catagoryMeals = DUMMY_MEALS.where((meal) {
      return meal.catagoriesId.contains(catagoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: drawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AllType(
            catagoryMeals[index].imageUrl,
            catagoryMeals[index].title,
            catagoryMeals[index].duration,
            catagoryMeals[index].ingredients,
            catagoryMeals[index].id,
          );
        },
        itemCount: catagoryMeals.length,
      ),
    );
  }
}
