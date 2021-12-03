import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/tela_despesas.dart';
import 'package:mymoney_test_1/helpers/despesas_helper.dart';

class AddDespesas extends StatefulWidget {
  @override
  _AddDespesasState createState() => _AddDespesasState();
}

class _AddDespesasState extends State<AddDespesas> {

  DespesaHelper helper = DespesaHelper();

  final _addValorDespesaController = TextEditingController();
  final _addDataDespesaController = TextEditingController();
  final _addCategoriaDespesaController = TextEditingController();
  final _addDescricaoDespesaController = TextEditingController();
  final nameFocus = FocusNode();
  var valueController;

  Despesa d = Despesa();

  isValueNull(){
    if(valueController == null){
      return valueController = "R\$ 0.00";
    } else {
      return valueController;
    }
  }

  @override
  Widget build(BuildContext context) {

    valueController = _addValorDespesaController;

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
          Container(
              height: MediaQuery.of(context).size.height*0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 20.0,top: 18.0,bottom: 20.0),
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        readOnly: true,
                        controller: isValueNull(),
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                        decoration: InputDecoration(
                          labelText: "R\$",
                          labelStyle: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none
                        ),
                      )
                  ),
                ],
              )),
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
                    onChanged: (text){
                      d.value=text;
                      double correctValue = double.parse(d.value);
                      d.value = correctValue;
                    },
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
                    onChanged: (text){
                      d.subtitle=text;
                    },
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
                    focusNode: nameFocus,
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
                    onChanged: (text){
                      d.title=text;
                    },
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
          if(d.title != null && d.title!.isNotEmpty){
            Navigator.pop(context, d);
          } else {
            FocusScope.of(context).requestFocus(nameFocus);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
