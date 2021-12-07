

import 'package:despesas_testando2/tela_grafico/tela_grafico.dart';
import 'package:despesas_testando2/ui/tela_despesas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pagina extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ola mundo'), leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (builder) => TelaReceitas()));}),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('ola mundo',style: TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic),),
              IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(
                builder: (BuildContext context) =>Grafico()));}),
            ],
          ),

        ),
      ),
    );
  }
}