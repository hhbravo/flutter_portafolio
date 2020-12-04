import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonHome extends StatelessWidget {
  //static const IconData menu = const IconData(0xe801);
  //static const IconData search = const IconData(0xe800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: HomeClipPath(),
                child: Container(
                  width: double.infinity,
                  height: 155,
                  color: Colors.red.withOpacity(.5),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.menu_outlined),
                            onPressed: () {},
                          ),
                        ),
                        Text(
                          'PokéMart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.search_outlined),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Pops!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black.withOpacity(.5)),
                    ),
                  )
                ],
              ),
              Container(
                height: 210,
                margin: EdgeInsets.only(top: 15, left: 20),
                //color: Colors.red[100],
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                    SizedBox(
                      width: 10,
                    ),
                    PokeItem('Greninja', 4.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget PokeItem(String name, double scale) {
  return Container(
    width: 170,
    height: 210,
    //color: Colors.white.withOpacity(.5),
    decoration: BoxDecoration(
        color: Colors.green.withOpacity(.4),
        borderRadius: BorderRadius.circular(25)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Image.network(
          'https://cdn.traction.one/pokedex/pokemon/658.png',
          scale: scale,
        )),
        Container(
          height: 40,
          width: 170,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'S/ 10.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class HomeClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(7, size.height - 50, 70, size.height - 50);
    path.lineTo(size.width - 40, size.height - 50);
    path.quadraticBezierTo(
        size.width, size.height - 50, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
