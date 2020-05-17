import 'package:flutter/material.dart';

class CampForm1 extends StatelessWidget {
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
  final bool isValid;
  final Map<String, Object> formData;

  final TextEditingController ctrl;
  CampForm1({
    this.heightSB,
    this.paddingL,
    this.paddingR,
    this.paddingB,
    this.paddingT,
    this.maxLines,
    this.maxLength,
    this.ctrl,
    this.widthSB,
    this.textSB,
    this.widthC,
    this.heightC,
    this.isValid,
    this.formData,
  });

  Widget _decideTextFormFild() {
    if (textSB == 'Descrição') {
      return TextFormField(
        initialValue: formData['description'],
        controller: ctrl,
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
      return TextFormField(
        onSaved: (value) => (textSB == 'Título')
            ? formData['title'] = value
            : formData['category'] = value,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            if (textSB == 'Título') {
              return '$textSB Inválido';
            } else {
              return '$textSB Inválida';
            }
          }
          return null;
        },
        controller: ctrl,
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
