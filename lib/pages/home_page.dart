import 'package:flutter/material.dart';
import 'package:primeiroapp/provider/favorites.provider-movie.dart';
import 'package:primeiroapp/provider/favorites.provider-serie.dart';
import 'package:primeiroapp/widgets/floatActBut-home.widget.dart';
import 'package:primeiroapp/widgets/list-constructor.dart';
import 'package:provider/provider.dart';
import '../layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final FavoriteMovieProvider movie = Provider.of(context);
    final FavoriteSerieProvider serie = Provider.of(context);
    final String nameAppBar = "   Início";
    final content = Column(
      children: <Widget>[
        ListConstructor.searchBar(),
        SizedBox(
          height: 35,
          width: 340,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Filmes',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        ListConstructor(
          type: 'movie',
          favorite: movie,
        ),
        SizedBox(
          height: 35,
          width: 340,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Séries',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        ListConstructor(
          type: 'serie',
          favorite: serie,
        ),
      ],
    );
    final fActBut = FloatActBut();
    return Layout.getContent(
      context,
      content,
      nameAppBar,
      fActBut,
    );
  }
}
