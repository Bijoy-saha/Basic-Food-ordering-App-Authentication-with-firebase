import 'package:flutter/material.dart';

class lasttt extends StatelessWidget {
  const lasttt({Key? key}) : super(key: key);
  static const routeName = '/ok';
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final list = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:list.map((tx){
            return Card(
              child:Text(tx.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
