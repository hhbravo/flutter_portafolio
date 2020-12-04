import 'package:flutter/widgets.dart';
import 'package:portafolio_flutter/grocery_store_block.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBloc bloc;
  final Widget child;

  GroceryProvider({@required this.bloc, @required this.child})
      : super(child: child);

  static GroceryProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
