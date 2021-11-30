import 'package:flutter/material.dart';
import 'Page_sobre.dart';
import 'main.dart';

class pagina extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ola mundo'), leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>Grafico()));}),
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
                        builder: (BuildContext context) => Page_sobre()));}),
            ],
          ),

        ),
      ),
    );
  }
}