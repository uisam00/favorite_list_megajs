import 'package:flutter/material.dart';

class CampFormNoEdit extends StatelessWidget {
  final double widthSB; //sizedbox width
  final double heightSB; //sizedbox height
  final String textSB;
  final double widthC; //container width
  final double heightC; //container height
  final double paddingL;
  final double paddingR;
  final double paddingT;
  final double paddingB;

  final Map<String, Object> formData;

  CampFormNoEdit({
    this.heightSB,
    this.paddingL,
    this.paddingR,
    this.paddingB,
    this.paddingT,
    this.widthSB,
    this.textSB,
    this.widthC,
    this.heightC,
    this.formData,
  });

  Widget _decideText() {
    if (textSB == 'Descrição') {
      return Text(formData['description']);
    } else if (textSB == 'Título:')
      return Text(formData['title']);
    else if (textSB == 'Categoria:')
      return Text(formData['category']);
    else if (textSB == 'Temp:')
      return Text(formData['season']);
    else
      return Text(formData['episode']);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: widthSB,
          height: heightSB,
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: textSB,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: paddingT, left: paddingL, right: paddingR, bottom: paddingB),
          child: Container(
            height: heightC,
            width: widthC,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.elliptical(10, 10),
              ),
            ),
            child: _decideText(),
          ),
        ),
      ],
    );
  }
}
