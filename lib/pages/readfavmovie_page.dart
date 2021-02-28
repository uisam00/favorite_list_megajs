import 'package:flutter/material.dart';
import 'package:primeiroapp/layout.dart';
import 'package:primeiroapp/widgets/read-item.widget.dart';

class ReadFavoriteMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nameAppBar = "Filme";
    final body = ReadItem();

    return Layout.getContent(
      context,
      body,
      nameAppBar,
    );
  }
}
