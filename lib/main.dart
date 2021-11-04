

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.white),
        ),
      )));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.roxoMoney,
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 1.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
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
            height: 500.0,
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 1.0),
            child: Column(children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 20.0),
                      )
              ),

              Divider(height: 30.0),
              TextField(
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle:
                          TextStyle(color: Colors.white, fontSize: 20.0),
                      border: OutlineInputBorder())),
              Divider(height: 30.0,),
              ButtonTheme(
                minWidth: 400.0, //Definindo dimensões do botão
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    //Configurando borda
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(color: Colors.rosaMoney)),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {},
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.rosaMoney,
                ),
              ),
              Divider(height: 150.0,),
              Text("Esqueceu a senha? Clique aqui.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ))
            ]),
          )
        ]));
  }
}

_ok() {}
