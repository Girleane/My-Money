import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';

void main() {
  runApp(MaterialApp(
    home: InicialPage(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        shadowColor: Colors.black,),
  ));
}
