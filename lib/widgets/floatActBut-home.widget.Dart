import 'package:flutter/material.dart';
import 'package:primeiroapp/menu/MenuAdd.dart';

import 'package:primeiroapp/routes/app_routes.dart';

class FloatActBut extends StatefulWidget {
  @override
  _FloatActButState createState() => _FloatActButState();
}

class _FloatActButState extends State<FloatActBut> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: PopupMenuButton<String>(
        color: Color(0xFF368B61),
        onSelected: choicesAction2,
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        itemBuilder: (BuildContext context) {
          return MenuAdd.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
      backgroundColor: Color(0xFF368B61),
      onPressed: () => {},
    );
  }

  void choicesAction2(String choices) {
    if (choices == MenuAdd.AddMovie) {
      Navigator.of(context).pushNamed(AppRoutes.ADD_MOVIE);
    } else if (choices == MenuAdd.AddSerie) {
      Navigator.of(context).pushNamed(AppRoutes.ADD_SERIE);
    }
  }
}
