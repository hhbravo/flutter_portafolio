import 'package:flutter/cupertino.dart';
import 'package:portafolio_flutter/grocery_product.dart';

enum GroceryState { normal, details, cart }

class GroceryStoreBloc with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);

  void changeTopNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeTopCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }
}
