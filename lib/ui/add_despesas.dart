import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mymoney_test_1/ui/add_despesas_top.dart';
import 'package:mymoney_test_1/ui/tela_despesas.dart';

class AddDespesas extends StatefulWidget {

  late final List despesaList;

  AddDespesas(this.despesaList);

  @override
  _AddDespesasState createState() => _AddDespesasState();
}

class _AddDespesasState extends State<AddDespesas> {
  final _addValorDespesaController = TextEditingController();
  final _addDataDespesaController = TextEditingController();
  final _addCategoriaDespesaController = TextEditingController();
  final _addDescricaoDespesaController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        widget.despesaList = json.decode(data);
      });
    });
  }

  void _addDespesa() {
    setState(() {
      Map<String, dynamic> newDespesa = Map();
      newDespesa["value"] = _addValorDespesaController.text;
      newDespesa["subtitle"] = _addDataDespesaController.text;
      newDespesa["category"] = _addCategoriaDespesaController.text;
      newDespesa["title"] = _addDescricaoDespesaController.text;
      _addValorDespesaController.text = '';
      _addDataDespesaController.text = '';
      _addCategoriaDespesaController.text = '';
      _addDescricaoDespesaController.text = '';
      widget.despesaList.add(newDespesa);

      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => TelaDespesas()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Adicionar despesa",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.0,
              letterSpacing: 1.7,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          AddDespesasTop(),
          Container(
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: Color(0xFFC4C9EB),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    controller: _addValorDespesaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: CircleAvatar(
                        child: Icon(
                          Icons.attach_money_rounded,
                          color: Color(0xFFC4C9EB),
                        ),
                        backgroundColor: Colors.black,
                        radius: 17.6,
                      ),
                      labelText: "Valor da Despesa",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    controller: _addDataDespesaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.access_time_outlined,
                        color: Colors.black,
                        size: 37,
                      ),
                      labelText: "Data",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    controller: _addCategoriaDespesaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 37,
                      ),
                      labelText: "Categoria",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    controller: _addDescricaoDespesaController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.chat,
                        color: Colors.black,
                        size: 37,
                      ),
                      labelText: "Adicionar descrição",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(
          Icons.check,
        ),
        onPressed: () {
          _addDespesa();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(widget.despesaList);
    final file = await _getFile();
    return file.writeAsString(data);
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
