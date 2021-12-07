

import 'package:despesas_testando2/helpers/receitas_helper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tela_despesas.dart';

class AddReceitas extends StatefulWidget {
  @override
  _AddReceitasState createState() => _AddReceitasState();
}

class _AddReceitasState extends State<AddReceitas> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ReceitaHelper helper = ReceitaHelper();

  final _addValorReceitaController = TextEditingController();
  final _addDataReceitaController = TextEditingController();
  final _addCategoriaReceitaController = TextEditingController();
  final _addDescricaoReceitaController = TextEditingController();
  final nameFocus = FocusNode();
  var valueController;

  Receita d = Receita();

  isValueNull(){
    if(valueController == null){
      return valueController = "R\$ 0.00";
    } else {
      return valueController;
    }
  }

  @override
  Widget build(BuildContext context) {

    valueController = _addValorReceitaController;

    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => TelaReceitas()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Adicionar receita",
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
        child: Form(
          key: _formKey,
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
                      controller: _addValorReceitaController,
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
                        labelText: "Valor da receita",
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "Insira um valor!";
                        }
                      },
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
                      controller: _addDataReceitaController,
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "Insira uma data!";
                        }
                      },
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
                      controller: _addCategoriaReceitaController,
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
                      controller: _addDescricaoReceitaController,
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "Insira uma descrição!";
                        }
                      },
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0DC607),
        elevation: 6,
        child: Icon(
          Icons.check,
        ),
        onPressed: () {
          if(_formKey.currentState!.validate()){
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