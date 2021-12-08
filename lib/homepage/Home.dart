import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';
import 'package:my_money_integrated/homepage/Menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var constante = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors
                .iceMoney, //This will change the drawer background to blue.
            //other styles
          ),
          child: Menu(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Olá, username!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27.0,
              )),
        ),
        backgroundColor: Colors.azulMoney,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 130.0,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 1.0),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Saldo Disponível",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500,
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return InicialPage();
                          },
                        ));
                      },
                      icon: Icon(Icons.visibility),
                      iconSize: 30.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ]),
            ),
            Container(
                height: 450.0,
                width: 420.0,
                decoration: BoxDecoration(
                    color: Colors.iceMoney,
                    borderRadius: BorderRadius.only(
                        /*topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),*/
                        )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 185.0, 10.0),
                        child: ButtonTheme(
                          minWidth: 20.0, //Definindo dimensões do botão
                          height: 50.0,
                          child: RaisedButton(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                //Configurando borda
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(color: Colors.black26)),
                            padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Home();
                                },
                              ));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.add_circle,
                                size: 30.0,
                                color: Colors.azulMoney,
                              ),
                              title: Text('Receitas',
                                  style: TextStyle(
                                      fontSize: 23.0, color: Colors.azulMoney)),
                              onTap: () => {},
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 185.0, 10.0),
                        child: ButtonTheme(
                          minWidth: 20.0, //Definindo dimensões do botão
                          height: 50.0,
                          child: RaisedButton(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                //Configurando borda
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(color: Colors.black26)),
                            padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Home();
                                },
                              ));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.check_box_rounded,
                                size: 30.0,
                                color: Colors.azulMoney,
                              ),
                              title: Text('Metas',
                                  style: TextStyle(
                                      fontSize: 23.0, color: Colors.azulMoney)),
                              onTap: () => {},
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 185.0, 10.0),
                        child: ButtonTheme(
                          minWidth: 20.0, //Definindo dimensões do botão
                          height: 50.0,
                          child: RaisedButton(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                //Configurando borda
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(color: Colors.black26)),
                            padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Home();
                                },
                              ));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.assessment,
                                size: 35.0,
                                color: Colors.azulMoney,
                              ),
                              title: Text('Gráficos',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.azulMoney)),
                              onTap: () => {},
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ])),
          ]),
        ));
  }
}
