import 'package:flutter/material.dart';

class pagina extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ola mundo'), leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
        Navigator.pop(context);
      }),),
      body: Container(
        child: Center(
          child: Text('ola mundo',style: TextStyle(fontSize: 25.0,fontStyle: FontStyle.italic),),
        ),
      ),
    );
  }
}