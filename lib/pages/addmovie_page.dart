import 'package:flutter/material.dart';
import 'package:primeiroapp/layout.dart';
import 'package:primeiroapp/widgets/add.widget.dart';

class AddMoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nameAppBar = "Adicionar Filme";
    final content = AddItem(
      type: 'movie',
    );

    return Layout.getContent(
      context,
      content,
      nameAppBar,
    );
  }
}
