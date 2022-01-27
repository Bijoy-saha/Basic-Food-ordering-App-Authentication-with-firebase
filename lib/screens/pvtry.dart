
import 'package:portfolio/models/trs.dart';

class okay  {
  List<transactions> items = [];
  addkor(String name,int val) {
    transactions khorch = transactions(
      name: name,
      date: DateTime.now(),
      cost: val,
    );
    items.add(khorch);
    print(items.length);
   
  }
}
