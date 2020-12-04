import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackDropExample extends StatefulWidget {
  @override
  _BackDropExampleState createState() => _BackDropExampleState();
}

class _BackDropExampleState extends State<BackDropExample> {
  double _value = 0.0;
  String url =
      'https://static.codepen.io/assets/packs/pug-b89bbcfe8d15af0485118d02637612af.svg';

  onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Center(
              child:
                  Text('Porcentaje ' + (_value * 100).toInt().toString() + '%'),
            )),
        //body to display all the content besides appbar
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.amber[400],
                margin: const EdgeInsets.all(20.0),
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  //color: const Color(0xff7c94b6),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(
                        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: _value * 10, sigmaY: _value * 10),
                  child: Container(
                    color: Colors.white.withOpacity(0),
                  ),
                ),
              ),
              //Showing the slider
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Slider(
                    value: _value,
                    onChanged: onChanged,
                    activeColor: Color(0XFF8034EB),
                    inactiveColor: Colors.redAccent,
                  ),
                ), //Container
              ), //Padding
            ], //Container
          ), //Column
        ), //Center
      ),
    ); //Scaffold
  }
}
