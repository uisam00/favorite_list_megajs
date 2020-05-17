import 'package:flutter/material.dart';
import 'package:primeiroapp/menu/MenuSand.dart';

class ListCategoryPage extends StatefulWidget {
  @override
  _ListCategoryPageState createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Categorias",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Color(0xFF368B61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
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
            onPressed: () {},
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: PopupMenuButton<String>(
              color: Color(0xFF368B61),
              onSelected: choicesAction,
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
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 50,
                      left: 15,
                    ),
                    child: Container(
                      height: 80,
                      width: 302,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFF368B61),
                              size: 33,
                            ),
                          ),
                          hintText: "Buscar",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 44,
                      top: 27,
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                      size: 38,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 150),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Nenhuma categoria adicionada",
                style: TextStyle(
                  fontSize: 13.5,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void choicesAction(String choices) {
  print('Menu Sanduiche');
}
