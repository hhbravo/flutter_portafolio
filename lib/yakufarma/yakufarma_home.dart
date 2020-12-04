import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portafolio_flutter/yakufarma/recomend_model.dart';
import 'package:portafolio_flutter/yakufarma/recomend_provider.dart';

class YakufarmaHomePrincipal extends StatefulWidget {
  @override
  _YakufarmaHomePrincipalState createState() => _YakufarmaHomePrincipalState();
}

class _YakufarmaHomePrincipalState extends State<YakufarmaHomePrincipal> {
  final recomends = RecomendProvider();
  List<int> generateNumbers() => List<int>.generate(30, (i) => i + 1);

  Widget _appBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Container(
          color: Colors.black38,
          height: 0.75,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Yakufarma',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
      ),
      leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
      actions: [
        IconButton(icon: Icon(Icons.person_outline), onPressed: null),
        IconButton(icon: Icon(Icons.shopping_bag_outlined), onPressed: null)
      ],
      backgroundColor: Colors.white30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Theme(
        data: ThemeData.light(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  /*   Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Yakufarma',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        Spacer(),
                        Icon(Icons.shop_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.person_outline),
                      ],
                    ),
                  ), */
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Column(
                      children: [
                        _categories(),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Recomendado para tí',
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'roboto'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      padding: EdgeInsets.only(right: 5),
                      child: GridView.count(
                        //scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.only(left: 5),
                        children: _buildGridTileList(
                            recomends.getRecomends().length,
                            recomends.getRecomends()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(
                            'https://dummyimage.com/350x200/000/fff'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Productos recientes',
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'roboto'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      padding: EdgeInsets.only(right: 5),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.only(left: 5),
                        children: _buildGridTileList(
                            recomends.getRecomends().length,
                            recomends.getRecomends()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                _appBar(),
                Container(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 20.0,
                  ),
                  child: TextField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFECEFF1),
                        contentPadding: const EdgeInsets.only(
                            left: 20.0, bottom: 5.0, top: 5.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: '¿Qué producto buscas?',
                        labelStyle:
                            TextStyle(backgroundColor: Color(0xFFB3B1B1))),
                  ),
                ),
                _categories(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        'Recomendado para tí',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.extent(
                    scrollDirection: Axis.vertical,
                    maxCrossAxisExtent: 300,
                    padding: const EdgeInsets.all(2),
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    children: _buildGridTileList(
                        recomends.getRecomends().length,
                        recomends.getRecomends()),
                  ),
                ),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}

List<Container> _buildGridTileList(int count, List<Recomend> recomends) =>
    List.generate(
      count,
      (i) => Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: NetworkImage(recomends[i].photo),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      recomends[i].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      recomends[i].symbol + recomends[i].amount.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Icon(
                        Icons.add_business_outlined,
                        size: 40,
                        color: Colors.blue[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            /*  Expanded(
              child: Column(
                children: [
                  Text(recomends[i].name),
                  Text(recomends[i].symbol + recomends[i].amount.toString()),
                ],
              ),
            ), */
          ],
        ),
      ),
    );

Widget _recomends(Recomend recomend) {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(recomend.photo),
          height: 100,
          width: 100,
        )
      ],
    ),
  );
}

class _categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 8,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          _itemCategories('Todos'),
          _itemCategories('Maternidad'),
          _itemCategories('Mamá y bebé'),
          _itemCategories('Vitaminias'),
          _itemCategories('Complementos'),
          _itemCategories('Mas categorías'),
        ],
      ),
    );
  }
}

Widget _itemCategories(String title) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: 13,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xFFFFCDD2),
        ),
        child: Container(
          padding: EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              image: NetworkImage('https://dummyimage.com/600x400/000/fff'),
              height: 65,
              width: 65,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(height: 6),
      Text(
        title,
        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
      )
    ],
  );
}
