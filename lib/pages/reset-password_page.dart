import 'package:flutter/material.dart';
import 'package:primeiroapp/routes/app_routes.dart';
import 'package:responsive/responsive.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
        backgroundColor: Color(0xFF368B61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              ResponsiveRow(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/icon_resetpass.png"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Problemas para entrar?\n",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(text: " "),
                          TextSpan(
                            text:
                                "Insira o seu nome de usuário ou email e enviaremos um link para você voltar a acessar a sua conta.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25, left: 30, right: 30),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "E-mail ou nome de usuário",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50, left: 50, top: 20),
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Color(0xFF368B61),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: FlatButton(
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Enviar link para login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 230, left: 40, right: 40),
                    child: Container(
                      child: FlatButton(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Criar nova conta.  ",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.SIGNUP);
                        },
                      ),
                    ),
                  ),
                  Divider(
                    indent: 40,
                    endIndent: 40,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
