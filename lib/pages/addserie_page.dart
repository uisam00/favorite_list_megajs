import 'package:flutter/material.dart';
import 'package:primeiroapp/widgets/add.widget.dart';
import '../layout.dart';

class AddSeriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nameAppBar = "Adicionar Série";
    final content = AddItem(
      type: 'serie',
    );

    return Layout.getContent(
      context,
      content,
      nameAppBar,
    );
  }
}
