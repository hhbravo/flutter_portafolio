import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_store_home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryStoreHome(),
    );
  }
}
