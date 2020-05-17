import 'package:flutter/material.dart';
import 'package:primeiroapp/menu/MenuSand.dart';
import 'package:primeiroapp/pages/login_page.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: RichText(
        text: TextSpan(
          text: "   Início",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Color(0xFF368B61),
      actions: <Widget>[
        FlatButton(
          child: RichText(
            text: TextSpan(
              text: "             Sair",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
        Container(
          padding: EdgeInsets.only(right: 5),
          child: PopupMenuButton<String>(
            color: Color(0xFF368B61),
            onSelected: null,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return MenuSand.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ),
      ],
    );
  }
}

// ListView.builder(
//   itemCount: movies.length,
//   itemBuilder: (ctx, i) => Text(
//     movies.values.elementAt(1i).title,
//     style: TextStyle(color: Colors.white),
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(top: 200),
//   child: RichText(
//     textAlign: TextAlign.center,
//     text: TextSpan(
//       text: "Nenhuma Lista adicionada",
//       style: TextStyle(
//         fontSize: 20.0,
//         color: Colors.grey,
//         fontWeight: FontWeight.w300,
//         fontFamily: "Roboto",
//       ),
//     ),
//   ),
// ),
