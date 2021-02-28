import 'package:flutter/material.dart';
import 'package:primeiroapp/routes/app_routes.dart';
import 'favoriteTile.widget.dart';

class ListConstructor extends StatelessWidget {
  final dynamic favorite;
  final String type;
  ListConstructor({@required this.favorite, @required this.type});

  Widget _decideWidget() {
    if (favorite.count == 0) {
      String textCenter = (type == 'movie')
          ? 'Nenhum Filme adicionado'
          : 'Nenhuma Série adicionada';
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 200),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: textCenter,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
            itemCount: favorite.count,
            itemBuilder: (ctx, i) {
              String route = ModalRoute.of(ctx).settings.name;
              if (route == AppRoutes.HOME) {
                return FavoriteTile(favorite.byIndex(favorite.count - i - 1));
              } else {
                return FavoriteTile(favorite.byIndex(i));
              }
            }),
      );
    }
  }

  static Widget searchBar() {
    return Container(
      height: 80.0,
      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.search,
              color: Color(0xFF368B61),
            ),
          ),
          hintText: "Buscar",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _decideWidget();
  }
}
