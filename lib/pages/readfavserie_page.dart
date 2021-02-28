import 'package:flutter/material.dart';
import 'package:primeiroapp/layout.dart';
import 'package:primeiroapp/widgets/read-item.widget.dart';

class ReadFavoriteSerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nameAppBar = "Série";
    final body = ReadItem();

    return Layout.getContent(
      context,
      body,
      nameAppBar,
    );
  }
}
