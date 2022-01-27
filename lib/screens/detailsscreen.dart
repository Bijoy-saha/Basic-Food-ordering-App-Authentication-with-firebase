// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/datas/dummy.dart';
import 'package:portfolio/drawer.dart';
import 'package:portfolio/models/trs.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DetailsScreen extends StatefulWidget {
  static const routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<transactions> items = [];
  // void go(BuildContext context) {
  //   final mealid = ModalRoute.of(context)!.settings.arguments as String;
  //   // final selctedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
  //   Navigator.of(context).pushReplacementNamed('/expanses', arguments: mealid);
  // }
  addkor(transactions x) {
    items.add(x);
    print(items.length);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
    final selctedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);

    transactions khorch = transactions(
      name: selctedmeal.title,
      date: DateTime.now(),
      cost: selctedmeal.duration * 5,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(selctedmeal.title),
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selctedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Row(children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text(
                    'duration: ${selctedmeal.duration}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    'name: ${selctedmeal.title}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Container(
                child: Text(
                  'ingredients',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (Context, index) => Card(
                    color: Colors.yellowAccent,
                    child: Text(selctedmeal.ingredients[index]),
                  ),
                  itemCount: selctedmeal.ingredients.length,
                ),
              ),
              Text('your bill : ${selctedmeal.duration * 5}'),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  items.add(khorch);
                  print(items.length);
                  Navigator.of(context).pushReplacementNamed(
                    '/ok',
                    arguments: items,
                  );
                },
                icon: Icon(Icons.delivery_dining),
                label: Text('place Order'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
