import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:my_money_integrated/homepage/Home.dart';

class DicasPage extends StatelessWidget {
  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      print('Não pode executar o link $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.azulMoney,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text("Dicas"),
        ),
        backgroundColor: Colors.azulMoney,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                width: double.infinity,
                //Container se adapta a largura de cada dispositivo
                child: Column(
                    //Definindo coluna
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await launch(
                              'https://g1.globo.com/economia/noticia/2021/12/08/selic-a-925percent-calculo-do-rendimento-da-poupanca-muda-veja-como-fica-e-o-comparativo-com-outros-investimentos.ghtml');
                        },
                        child: Image.asset('images/imagem1.jpeg'),
                      ),
                    ])),
            Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                width: double.infinity,
                //Container se adapta a largura de cada dispositivo
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        TextButton(
                            onPressed: () async {
                              await launch(
                                  'https://www.mirago.com.br/aprender-marketing-digital/');
                            },
                            child: Image.asset('images/imagem2.png')),
                      ])
                    ])),
            Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                width: double.infinity,
                //Container se adapta a largura de cada dispositivo
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        TextButton(
                            onPressed: () async {
                              await launch(
                                  'https://www.infomoney.com.br/guias/criptomoedas/');
                            },
                            child: Image.asset('images/imagem3.png')),
                      ])
                    ]))
          ]),
        ));
  }
}
