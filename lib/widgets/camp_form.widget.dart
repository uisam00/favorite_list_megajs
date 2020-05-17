import 'package:flutter/material.dart';

class CampForm extends StatelessWidget {
  final double widthSB; //sizedbox width
  final double heightSB; //sizedbox height
  final String textSB;
  final double widthC; //container width
  final double heightC; //container height
  final double paddingL;
  final double paddingR;
  final double paddingT;
  final double paddingB;
  final int maxLines;
  final int maxLength;

  final Map<String, Object> formData;

  CampForm({
    this.heightSB,
    this.paddingL,
    this.paddingR,
    this.paddingB,
    this.paddingT,
    this.maxLines,
    this.maxLength,
    this.widthSB,
    this.textSB,
    this.widthC,
    this.heightC,
    this.formData,
  });

  Widget _decideTextFormFild() {
    if (textSB == 'Descrição') {
      return TextFormField(
        initialValue: formData['description'],
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(10, 10),
            ),
          ),
        ),
        onSaved: (value) => formData['description'] = value,
      );
    } else {
      String typeForm;
      if (textSB == 'Título:')
        typeForm = 'title';
      else if (textSB == 'Categoria:')
        typeForm = 'category';
      else if (textSB == 'Temp:')
        typeForm = 'season';
      else if (textSB == 'Ep:') typeForm = 'episode';
      if (textSB == 'Ep:' || textSB == 'Temp:') {
        return TextFormField(
          initialValue: formData[typeForm],
          onSaved: (value) => formData[typeForm] = value,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.elliptical(10, 10),
              ),
            ),
          ),
        );
      }
      return TextFormField(
        initialValue: formData[typeForm],
        onSaved: (value) => formData[typeForm] = value,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            if (textSB == 'Título') {
              return '$textSB Inválido';
            }
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(10, 10),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: heightSB,
          width: widthSB,
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
            left: paddingL,
            top: paddingT,
            right: paddingR,
            bottom: paddingB,
          ),
          child: Container(
            height: heightC,
            width: widthC,
            child: _decideTextFormFild(),
          ),
        ),
      ],
    );
  }
}
