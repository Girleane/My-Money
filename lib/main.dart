import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/tela_despesas.dart';
import 'package:intl/date_symbol_data_local.dart';


void main(){
  initializeDateFormatting().then((_) => runApp(DespesasPage()));
}



class DespesasPage extends StatefulWidget {
  const DespesasPage({Key? key}) : super(key: key);

  @override
  _DespesasPageState createState() => _DespesasPageState();
}

class _DespesasPageState extends State<DespesasPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        ));
  }
}
