import 'package:flutter/material.dart';
import 'package:primeiroapp/routes/app_routes.dart';
import 'package:responsive/responsive.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Criar Conta'),
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
                height: MediaQuery.of(context).size.height * 0.05,
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
                        text: "Cadastre-se para criar listas de\n",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " seus filmes e séries favoritos",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    hintText: "Nome Completo",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    hintText: "Usuário",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    hintText: "E-mail",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Cadastre-se",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200, left: 40, right: 40),
                child: Container(
                  child: FlatButton(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Já tem uma conta?  ",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Conecte-se.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.LOGIN_PAGE);
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
    );
  }
}
