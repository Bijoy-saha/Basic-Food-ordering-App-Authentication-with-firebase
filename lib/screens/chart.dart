// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/models/trs.dart';

class Chart extends StatelessWidget {
  final List<transactions> recents;
  Chart(this.recents,);
  List<Map<String, Object>> get grouptotal {
    return List.generate(30, (index) {
      final date = DateTime.now().subtract(
        Duration(days: index),
      );
      double sum = 0;
      for (var i = 0; i < recents.length; i++) {
        if (recents[i].date.day == date.day &&
            recents[i].date.year == date.year &&
            recents[i].date.month == date.month) {
          sum += recents[i].cost;
        }
      }
      return {
        'date': DateFormat.E(date),
        'amount': sum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 6,
      child: Row(
        children: [],
      ),
    );
  }
}
