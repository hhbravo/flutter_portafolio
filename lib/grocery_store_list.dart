import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_provider.dart';
import 'package:grocery_store/grocery_store_home.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;

    return ListView.builder(
      padding: const EdgeInsets.only(top: cartBarHeigth),
      itemCount: bloc.catalog.length,
      itemBuilder: (context, index) {
        return Container(
          height: 300,
          width: 100,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
    );
  }
}
