import 'package:flutter/material.dart';
import 'package:primeiroapp/routes/app_routes.dart';
import 'package:responsive/responsive.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              ResponsiveRow(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Container(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Lista de\n",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Filmes e Séries'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 45, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    icon: Icon(
                      Icons.people,
                      color: Color(0xFF368B61),
                    ),
                    hintText: "Usuário",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    icon: Icon(
                      Icons.https,
                      color: Color(0xFF368B61),
                    ),
                    hintText: "Senha",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 80, left: 100, top: 20),
                child: Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Color(0xFF368B61),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.HOME);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40, left: 40, top: 10),
                child: Container(
                  child: FlatButton(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Esqueceu seus dados de login?",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Obtenha ajuda.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.RESET_PASSWORD);
                    },
                  ),
                ),
              ),
              new RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "OU",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: FlatButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/icon_fb.png",
                          height: 20,
                          width: 20,
                        ),
                        new RichText(
                          text: TextSpan(
                            text: " Entrar com o Facebook",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Image.asset(
                        //   "assets/images/icon_google.png",
                        //   height: 20,
                        //   width: 20,
                        // ),
                        // Text('  Entrar com o Google'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 175),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF2B6A4B),
                  ),
                  child: FlatButton(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Ainda não tem conta?  ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Cadastre-se.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.SIGNUP);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
