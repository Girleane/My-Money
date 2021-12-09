import 'package:flutter/material.dart';
import 'package:my_money_integrated/acesso/Entrar.dart';

import 'register/Registrar1.dart';

//O metodo build armazena a execução da classe Home
class InicialPage extends StatefulWidget {
  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.azulMoney,
      //Definindo a cor do plano de fundo em hexadecimal
      body: Container(
        padding: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
        width: double.infinity, //Container se adapta a largura de cada dispositivo
        child: Column(          //Definindo coluna
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Image.asset("images/my_money.png", //Logo do app
                  scale: 0.75, //Ajustando o tamanho da imagem
                  width: 700,
                  height: 250,
              ),
              SizedBox(height: 50), //Colocando espaçamento entre widgets
              Text(             //Texto abaixo da logo
                  "Gestão simplificada de suas finanças!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: "RedRose",
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white)),
              SizedBox(height: 100), //Colocando espaçamento entre widgets
              ButtonTheme(
                //Botão Começar
                minWidth: 330.0, //Definindo dimensões do botão
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    //Configurando borda
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.iceMoney)),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Registrar1();
                      },
                    ));
                  },
                  child: Text(
                    "Começar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.pinkMoney,
                ),
              ),
              SizedBox(height: 10),
              ButtonTheme(
                //Botão Já sou Cadastrado
                minWidth: 330.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.pinkMoney)),

                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Entrar();
                      },
                    ));
                  },
                  child: Text(
                    "Já sou cadastrado",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pinkMoney,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}