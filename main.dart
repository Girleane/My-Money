import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

//O metodo build armazena a execução da classe Home
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3E9C),
      //Definindo a cor do plano de fundo em hexadecimal
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity, //Container se adapta a largura de cada dispositivo
        child: Column(          //Definindo coluna
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Image.asset("Images/mymoney.png", //Logo do app
                  scale: 0.75, //Ajustando o tamanho da imagem
                  width: 700,
                  height: 350),
              SizedBox(height: 50), //Colocando espaçamento entre widgets
              Text(             //Texto abaixo da logo
                  "Gestão simplificada de suas finanças!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: "RedRose",
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white)),
              SizedBox(height: 150), //Colocando espaçamento entre widgets
              ButtonTheme(
                //Botão Começar
                minWidth: 400.0, //Definindo dimensões do botão
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      //Configurando borda
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.cinzinha)),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {},
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
                minWidth: 400.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.pinkMoney)),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {},
                  child: Text(
                    "Já sou cadastrado",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pinkMoney,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.cinzinha,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
