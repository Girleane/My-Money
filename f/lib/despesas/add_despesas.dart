import 'package:flutter/material.dart';
import 'package:my_money_integrated/helpers/despesas_helper.dart';

class AddDespesas extends StatefulWidget {
  final Despesa? despesa;
  AddDespesas({this.despesa});

  @override
  _AddDespesasState createState() => _AddDespesasState();
}

class _AddDespesasState extends State<AddDespesas> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DespesaHelper helper = DespesaHelper();

  final _addValorDespesaController = TextEditingController();
  final _addDataDespesaController = TextEditingController();
  final _addDescricaoDespesaController = TextEditingController();
  final nameFocus = FocusNode();
  var valueController;
  bool _userEdited = false;

  late Despesa d;

  @override
  void initState() {
    super.initState();
    if (widget.despesa == null) {
      d = Despesa();
    } else {
      d = Despesa.fromMap(widget.despesa!.toMap());

      _addValorDespesaController.text = d.value.toString();
      _addDataDespesaController.text = d.subtitle!;
      _addDescricaoDespesaController.text = d.title!;
    }
  }

  isValueNull() {
    if (valueController == null) {
      return valueController = "R\$ 0.00";
    } else {
      return valueController;
    }
  }

  @override
  Widget build(BuildContext context) {
    valueController = _addValorDespesaController;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFF33429F),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 100.0),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(d.title ?? "Adicionar despesa",
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
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 18.0, bottom: 20.0),
                          alignment: Alignment.centerLeft,
                          child: TextField(
                            readOnly: true,
                            controller: isValueNull(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                            decoration: InputDecoration(
                                labelText: "R\$",
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          )),
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
                          labelText: "Valor da despesa",
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
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira um valor!";
                          }
                        },
                        onChanged: (text) {
                          d.value = text;
                          double correctValue = double.parse(d.value);
                          d.value = correctValue;
                          _userEdited = true;
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
                        keyboardType: TextInputType.datetime,
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
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira uma data!";
                          }
                        },
                        onChanged: (text) {
                          d.subtitle = text;
                          _userEdited = true;
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
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira uma descrição!";
                          }
                        },
                        onChanged: (text) {
                          d.tipo = "d";
                          _userEdited = true;
                          setState(() {
                            d.title = text;
                          });
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
          backgroundColor: Color(0xFFCF2323),
          elevation: 6,
          child: Icon(
            Icons.check,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, d);
            } else {
              FocusScope.of(context).requestFocus(nameFocus);
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      onWillPop: _requestPop,
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se Sair as alterações serao perdidas!"),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text("Sim")),
              ],
            );
          });
      return Future.value(false);
    } else {
      Navigator.pop(context, d);
      return Future.value(true);
    }
  }
}
