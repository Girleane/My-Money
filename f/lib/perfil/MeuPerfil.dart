import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/homepage/Home.dart';

class MeuPerfil extends StatefulWidget {
  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.iceMoney,
        appBar: AppBar(
          title: Text("Meu Perfil"),
          backgroundColor: Colors.azulMoney,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Home();
                },
              ));
            },
            icon: Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,       //Alinhamento da coluna no centro
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 32,bottom: 0),
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.azulMoney,
                            size: 120,
                          )
                      ),

                      Padding(
                          padding: EdgeInsets.only(top: 0,bottom: 16),
                          child: GestureDetector(
                            onTap: (){print("Tocou viu");},
                            child: Text(
                              "Alterar foto do perfil",
                              style: TextStyle(
                                  color: Colors.azulMoney,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          )
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left:10,top: 30,bottom: 0),
                              child: Text(
                                "Nome:",
                                style: TextStyle(
                                  color: Colors.azulMoney,
                                  fontSize: 15,
                                ),
                              )
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:10,top: 0,bottom: 0, right: 10),
                          child: TextField(
                          )
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left:10,top: 20,bottom: 0),
                              child: Text(
                                "Email:",
                                style: TextStyle(
                                  color: Colors.azulMoney,
                                  fontSize: 15,
                                ),
                              )
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:10,top: 0,bottom: 0, right: 10),
                          child: TextField(

                          )
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left:10,top: 20,bottom: 0),
                              child: Text(
                                "Nova senha:",
                                style: TextStyle(
                                  color: Colors.azulMoney,
                                  fontSize: 15,
                                ),
                              )
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:10,top: 0,bottom: 0, right: 10),
                          child: TextField(

                          )
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left:10,top: 20,bottom: 0),
                              child: Text(
                                "Confirmar nova senha:",
                                style: TextStyle(
                                  color: Colors.azulMoney,
                                  fontSize: 15,
                                ),
                              )
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:10,top: 0,bottom: 0, right: 10),
                          child: TextField(

                          )
                      ),
                      SizedBox(height: 40),
                      ButtonTheme(
                        //Botão Atualizar
                          minWidth: 300.0,
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            onPressed: () {},
                            child: Text(
                              "Atualizar",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.azulMoney,
                          )
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ))));
  }
}
