import 'package:flutter/material.dart';
import 'package:my_money_integrated/acesso/InicialPage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MaterialApp(
    home: InicialPage(),
    theme: ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,
      shadowColor: Colors.black,),
  )));
}
