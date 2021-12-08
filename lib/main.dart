import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';

void main() async {
  runApp(MaterialApp(
    home: InicialPage(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        shadowColor: Colors.black,)
  ));
}


void register (BuildContext context) async{
  FirebaseUSer

}