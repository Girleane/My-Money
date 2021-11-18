import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/Lista_Despesas.dart';
import 'package:mymoney_test_1/ui/month_view.dart';

import 'add_despesas.dart';

class TelaDespesas extends StatefulWidget {

  const TelaDespesas({Key? key}) : super(key: key);

  @override
  _TelaDespesasState createState() => _TelaDespesasState();
}

class _TelaDespesasState extends State<TelaDespesas> {

  List despesaList = [];

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        despesaList = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Despesas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.0,
              letterSpacing: 1.7,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
        toolbarHeight: height * 0.1,
      ),
      body: Stack(
        //fit: StackFit.expand,
        children: [
              MonthView(),
              ListaDepesas(despesaList)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddDespesas(despesaList)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return "algo deu errado!";
    }
  }

}
