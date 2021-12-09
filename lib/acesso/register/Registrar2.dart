import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_money_integrated/homepage/Home.dart';

import 'Registrar1.dart';

class Registrar2 extends StatefulWidget {
  const Registrar2({Key? key}) : super(key: key);

  @override
  _Registrar2State createState() => _Registrar2State();
}

class _Registrar2State extends State<Registrar2> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _userController = TextEditingController();

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
                        return Registrar1();
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
            height: 700.0,
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 1.0),
            child: Form(
              key: _formKey,
              child:Column(children: <Widget>[
                TextFormField(
                    controller:_userController,
                    validator: (value){
                      if(value == ""){
                        return "Campo Obrigatorio";
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    )),
                Divider(height: 50.0),
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
                      if(_formKey.currentState!.validate()){
                        var home = Receber();
                        home.receberUser(_userController.text);
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Home();
                          },
                        ));
                      }
                    },
                    child: Text(
                      "Concluir",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.pinkMoney,
                  ),
                ),
                Divider(
                  height: 250.0,
                ),
                Text(
                  "Ao registrar-se você concorda com",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "os Termos de Serviço e Política de",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Privacidade.",
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ]),
            )
          )
        ])));
  }
}
