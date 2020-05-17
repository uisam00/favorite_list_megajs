import 'package:flutter/material.dart';
import 'package:primeiroapp/provider/favorites.provider-movie.dart';
import 'package:primeiroapp/widgets/floac_act_but_fav.dart';

import 'package:primeiroapp/widgets/list-constructor.dart';
import 'package:provider/provider.dart';

import '../layout.dart';

class ListMoviePage extends StatefulWidget {
  @override
  _ListMoviePageState createState() => _ListMoviePageState();
}

class _ListMoviePageState extends State<ListMoviePage> {
  @override
  Widget build(BuildContext context) {
    final FavoriteMovieProvider movie = Provider.of(context);
    final content = Column(
      children: <Widget>[
        ListConstructor.searchBar(),
        ListConstructor(
          type: 'movie',
          favorite: movie,
        ),
      ],
    );
    final nameAppBar = 'Lista Filmes';
    final fActBut = FloatButFav.floatAct(context, 'movie');
    return Layout.getContent(
      context,
      content,
      nameAppBar,
      fActBut,
    );
  }
}
