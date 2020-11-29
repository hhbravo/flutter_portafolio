import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_provider.dart';
import 'package:grocery_store/grocery_store_block.dart';
import 'package:grocery_store/grocery_store_list.dart';

const _backgroundColor = Color(0XFFF6F5F2);
const cartBarHeigth = 100.0;
const _panelTransition = Duration(microseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  @override
  _GroceryStoreHomeState createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    print(details.primaryDelta);
    if (details.primaryDelta < -7) {
      bloc.changeTopCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeTopNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeigth;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeigth / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - kToolbarHeight - cartBarHeigth;
    } else if (state == GroceryState.cart) {
      return cartBarHeigth / 2;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            body: Container(
              child: Column(
                children: [
                  _AppBarGrocery(),
                  Expanded(
                      child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForWhitePanel(bloc.groceryState, size),
                        height: size.height - kToolbarHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                30,
                              ),
                              bottomRight: Radius.circular(
                                30,
                              ),
                            ),
                          ),
                          child: GroceryStoreList(),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: _panelTransition,
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForBlackPanel(bloc.groceryState, size),
                        height: size.height,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: _backgroundColor,
      child: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Fruits and vegetables',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: () => null)
        ],
      ),
    );
  }
}
