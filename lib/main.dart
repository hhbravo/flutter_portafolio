import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portafolio_flutter/pokemon/pokemon_home.dart';
import 'package:portafolio_flutter/yakufarma/yakufarma_home.dart';
import 'package:portafolio_flutter/backdrop/backdrop_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _onPressed(BuildContext context, Widget child) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 20);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Portafolio'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: [
          separator,
          RaisedButton(
            child: Text('BackDropExample'),
            onPressed: () => _onPressed(
              context,
              BackDropExample(),
            ),
          ),
          RaisedButton(
            child: Text('Yakufarma'),
            onPressed: () => _onPressed(
              context,
              YakufarmaHomePrincipal(),
            ),
          ),
          RaisedButton(
            child: Text('Poke App'),
            onPressed: () => _onPressed(
              context,
              PokemonHome(),
            ),
          ),
        ],
      ),
    );
  }
}
