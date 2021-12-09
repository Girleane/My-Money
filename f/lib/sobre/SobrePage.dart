import 'package:flutter/material.dart';
import 'package:my_money_integrated/homepage/Home.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff33429F),
          title: Text('Sobre'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              }),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffd6daf6),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 35.0, bottom: 15),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff33429F),
                    radius: 140,
                    child: Container(
                      width: 240.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Color(0xff33429F),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('images/my_money.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                  child: Center(
                    child: Container(
                      height: 35.0,
                      width: 200.0,
                      child: Center(
                        child: Text(
                          "0.0.1",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Projeto Desenvolvido por:',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Text(
                          'Caio Varela',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Girleane Calixto',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'João Alexandre',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'José Edilson',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Juan Pablo',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Lucas Mendes',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Marcos Vinícius',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
