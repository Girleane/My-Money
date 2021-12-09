import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'InicialPage.dart';
import '../homepage/Home.dart';
import 'banco.dart';

class Entrar extends StatefulWidget {
  const Entrar({Key? key}) : super(key: key);

  @override
  _EntrarState createState() => _EntrarState();
}

class _EntrarState extends State<Entrar> {
  var banco = Banco();
  List _user = [];

  var _emailController = TextEditingController();
  var _senhaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    banco.readData().then((data) {
      setState(() {
        _user = json.decode(data!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.azulMoney,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 1.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return InicialPage();
                              },
                            ));
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.white,
                        ),
                        Text("Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 700.0,
                    padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 1.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value == "") {
                            return "Campo Obrigatório";
                          }
                        },
                      ),
                      Divider(height: 30.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        controller: _senhaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo Obrigatório";
                          }
                        },
                      ),
                      Divider(
                        height: 50.0,
                      ),
                      ButtonTheme(
                        minWidth: 400.0, //Definindo dimensões do botão
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              //Configurando borda
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(color: Colors.pinkMoney)),
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String verificar = json.encode(_user);
                              if (verificar.contains(_emailController.text)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                              else{
                                final snack = SnackBar(
                                  content: Text("Usuário não cadastrado"),
                                  action: SnackBarAction(
                                      label: "Tentar novamente",
                                      onPressed: () {
                                        setState(() {
                                          _emailController.text = "";
                                          _senhaController.text = "";
                                        });
                                      }),
                                  duration: Duration(seconds: 5),
                                );
                                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(snack);
                              }
                            }
                          },
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.pinkMoney,
                        ),
                      ),
                      Divider(
                        height: 120.0,
                      ),
                      TextButton(
                        child: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                        },
                      ),
                    ]),
                  )
                ]))));
  }
}
