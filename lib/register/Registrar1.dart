import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';
import 'package:my_money_integrated/register/Registrar2.dart';

class Registrar1 extends StatefulWidget {
  const Registrar1({Key? key}) : super(key: key);

  @override
  _Registrar1State createState() => _Registrar1State();
}

class _Registrar1State extends State<Registrar1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.azulMoney,
        body: SingleChildScrollView(
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
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  )),
              Divider(height: 30.0),
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  )),
              Divider(
                height: 30.0,
              ),
              TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: " Confirmar Senha",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  )),
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
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Registrar2();
                      },
                    ));
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
              ),
            ]),
          )
        ])));
  }
}
