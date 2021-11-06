import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/tela_despesas.dart';


void main(){
  runApp(MaterialApp(
      home: TelaDespesas(),
      theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.white),
        ),
      )));
}