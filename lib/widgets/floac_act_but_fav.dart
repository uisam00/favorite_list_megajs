import 'package:flutter/material.dart';
import 'package:primeiroapp/pages/addmovie_page.dart';
import 'package:primeiroapp/pages/addserie_page.dart';

class FloatButFav {
  static Widget floatAct(BuildContext context, String whichPage) {
    return FloatingActionButton(
      child: Container(
        child: RichText(
          text: TextSpan(
            text: 'ADD',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF368B61),
      onPressed: () {
        if (whichPage == 'movie') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMoviePage(),
            ),
          );
        } else if (whichPage == 'serie') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSeriePage(),
            ),
          );
        }
      },
    );
  }
}
