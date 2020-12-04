import 'package:portafolio_flutter/yakufarma/recomend_model.dart';

class RecomendProvider {
  List<Recomend> recomends;

  List<Recomend> getRecomends() {
    recomends = [
      Recomend(
          amount: 90.0,
          name: 'Future',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
      Recomend(
          amount: 10.0,
          name: 'Human',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
      Recomend(
          amount: 32.20,
          name: 'Future',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
      Recomend(
          amount: 190.0,
          name: 'Principal',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
      Recomend(
          amount: 290.0,
          name: 'Legacy',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
      Recomend(
          amount: 490.0,
          name: 'Investor',
          photo: 'https://fakeimg.pl/300/',
          symbol: 'S/'),
    ];

    return recomends;
  }
}
