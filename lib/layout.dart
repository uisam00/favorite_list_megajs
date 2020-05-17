import 'package:flutter/material.dart';

import 'package:primeiroapp/routes/app_routes.dart';
import 'menu/MenuSand.dart';

class Layout {
  static Scaffold getContent(
      BuildContext context, dynamic content, String nameAppbar,
      [dynamic fActBut]) {
    void choicesAction(String choices) {
      if (choices == MenuSand.ListMovie &&
          ModalRoute.of(context).settings.name != AppRoutes.LIST_MOVIE) {
        Navigator.of(context).pushNamed(AppRoutes.LIST_MOVIE);
      } else if (choices == MenuSand.ListSerie &&
          ModalRoute.of(context).settings.name != AppRoutes.LIST_SERIE) {
        Navigator.of(context).pushNamed(AppRoutes.LIST_SERIE);

        // } else if (choices == MenuSand.Settings){
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => SettingsPage(),
        //     ),
        //   );
      } else {
        Navigator.of(context).pop();
      }
    }

    AppBar myappbar = AppBar(
      leading: (Navigator.canPop(context) &&
              ModalRoute.of(context).settings.name != AppRoutes.HOME)
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.popUntil(
                //     context, ModalRoute.withName(AppRoutes.HOME));
              },
            )
          : null,
      automaticallyImplyLeading: false,
      title: RichText(
        text: TextSpan(
          text: nameAppbar,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Color(0xFF368B61),
      actions: <Widget>[
        FlatButton(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: RichText(
              text: TextSpan(
                text: "Sair",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.LOGIN_PAGE);
          },
        ),
        Container(
          padding: EdgeInsets.only(right: 5),
          child: PopupMenuButton<String>(
            color: Color(0xFF368B61),
            onSelected: (String choice) {
              choicesAction(choice);
            },
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

    return Scaffold(
      appBar: myappbar,
      body: content,
      floatingActionButton: fActBut,
    );
  }
}
