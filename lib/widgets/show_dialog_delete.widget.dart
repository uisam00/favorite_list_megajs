import 'package:flutter/material.dart';
import 'package:primeiroapp/classes/favorite.dart';
import 'package:primeiroapp/provider/favorites.provider-movie.dart';
import 'package:primeiroapp/provider/favorites.provider-serie.dart';
import 'package:provider/provider.dart';

class ShowDialogDelete {
  static show(BuildContext context, Favorite fav) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir Favoritos'),
        content: Text('Tem Certeza?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Não'),
          ),
          FlatButton(
            onPressed: () {
              if (fav.type == 'serie') {
                Provider.of<FavoriteSerieProvider>(context, listen: false)
                    .remove(fav);
              } else {
                Provider.of<FavoriteMovieProvider>(context, listen: false)
                    .remove(fav);
              }
              Navigator.of(context).pop();
            },
            child: Text('Sim'),
          ),
        ],
      ),
    );
  }
}
