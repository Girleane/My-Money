import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/acesso/Entrar.dart';
import 'package:my_money_integrated/acesso/InicialPage.dart';

import '../banco.dart';
import 'Registrar2.dart';

class Registrar1 extends StatefulWidget {
  const Registrar1({Key? key}) : super(key: key);

  @override
  _Registrar1State createState() => _Registrar1State();
}

class _Registrar1State extends State<Registrar1> {
  var banco = Banco();

  var _emailController = TextEditingController();
  var _senhaController = TextEditingController();
  var _confSenhaController = TextEditingController();

  List _user = [];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addUser() {
    setState(() {
      Map<String, dynamic> newUser = Map();
      if (json.encode(_user).contains(_emailController.text)) {
        final snack = SnackBar(
          content: Text("Email já cadastrado"),
          action: SnackBarAction(
              label: "Ir para a aba de Login",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Entrar();
                  },
                ));
              }),
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snack);
      } else {
        newUser['Email'] = _emailController.text;
        newUser['senha'] = _senhaController.text;
        _emailController.text = "";
        _senhaController.text = "";
        _user.add(newUser);

        banco.saveData(_user);
      }
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
                        Text("Registrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 500.0,
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
                        validator: (value) {
                          if (value == "") {
                            return "Campo Obrigatório";
                          }
                        },
                        controller: _emailController,
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
                        validator: (value) {
                          if (value == "") {
                            return "Campo Obrigatório";
                          }
                        },
                        controller: _senhaController,
                      ),
                      Divider(
                        height: 30.0,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Confirmar Senha",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20.0),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        validator: (value) {
                          if (value == "") {
                            return "Campo Obrigatório";
                          }
                        },
                        controller: _confSenhaController,
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
                              if (_senhaController.text ==
                                  _confSenhaController.text) {
                                _addUser();
                                Navigator.push(context, MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Registrar2();
                                  },
                                ));
                              } else {
                                final snack = SnackBar(
                                  content: Text("Senhas não conferem"),
                                  action: SnackBarAction(
                                      label: "Tentar novamente",
                                      onPressed: () {
                                        setState(() {
                                          _senhaController.text = "";
                                          _confSenhaController.text = "";
                                        });
                                      }),
                                  duration: Duration(seconds: 5),
                                );
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snack);
                              }
                            }
                          },
                          child: Text(
                            "Próximo",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.pinkMoney,
                        ),
                      )
                    ]),
                  )
                ]))));
  }
}
