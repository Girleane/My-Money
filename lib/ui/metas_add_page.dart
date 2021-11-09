import 'package:flutter/material.dart';
import 'package:meta_old_sdk/helpers/meta_helper.dart';
import 'package:meta_old_sdk/ui/metas_home_page.dart';

class MetasAddPage extends StatefulWidget {
  final Meta meta;

  MetasAddPage({this.meta});

  @override
  _MetasAddPageState createState() => _MetasAddPageState();
}

class _MetasAddPageState extends State<MetasAddPage> {
  bool _metaEdited = false;
  Meta _editedMeta;

  TextEditingController _valorMetaController = TextEditingController();
  TextEditingController _valorInicialController = TextEditingController();
  TextEditingController _previsaoController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  final _nameFocus = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    _valorMetaController.text = "";
    _valorInicialController.text = "";
    _previsaoController.text = "";
    _nomeController.text = "";
    _descricaoController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.meta == null) {
      _editedMeta = Meta();
    } else {
      _editedMeta = Meta.fromMap(widget.meta.toMap());
      _editedMeta = Meta.fromMap(widget.meta.toMap());
      _valorMetaController.text = _editedMeta.valorMeta;
      _valorInicialController.text = _editedMeta.valorInicial;
      _previsaoController.text = _editedMeta.previsao;
      _nomeController.text = _editedMeta.name;
      _descricaoController.text = _editedMeta.descricao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueMoney,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return MetasHomePage();
                      },
                    ));
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(_editedMeta.name ?? 'Nova meta'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'Show Snackbar',
                onPressed: _resetFields,
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_editedMeta.name != null && _editedMeta.name.isNotEmpty) {
              Navigator.pop(context, _editedMeta);
            } else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.done),
          backgroundColor: Colors.pinkMoney,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.blueMoney,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0.0),
              ),
              Container(
                color: Colors.blueMoney,
                padding: EdgeInsets.fromLTRB(70.0, 30.0, 10.0, 30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valor da meta:',
                        style: TextStyle(
                          fontFamily: 'LilitaOne',
                          color: Colors.white,
                        ),
                      ),
                      Text(''),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "R\$",
                          labelStyle: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize: 35.0,
                              color: Colors.white),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                        controller: _valorMetaController,
                        onChanged: (text) {
                          _metaEdited = true;
                          _editedMeta.valorMeta = text;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Insira um dado!";
                          }
                        },
                      ),
                    ]),
              ),
              Container(
                  height: 420.0,
                  decoration: BoxDecoration(
                      color: Colors.iceMoney,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      )),
                  padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.local_atm,
                                color: Colors.black,
                              ),
                              labelText: "Valor inicial",
                              labelStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25.0),
                          controller: _valorInicialController,
                          onChanged: (text) {
                            _metaEdited = true;
                            _editedMeta.valorInicial = text;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Insira um dado!";
                            }
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.access_time,
                                color: Colors.black,
                              ),
                              labelText: "Previsão da meta (data)",
                              labelStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25.0),
                          controller: _previsaoController,
                          onChanged: (text) {
                            _metaEdited = true;
                            _editedMeta.previsao = text;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Insira um dado!";
                            }
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.create,
                                color: Colors.black,
                              ),
                              labelText: "Nome da meta",
                              labelStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25.0),
                          controller: _nomeController,
                          focusNode: _nameFocus,
                          onChanged: (text) {
                            _metaEdited = true;
                            setState(() {
                              _editedMeta.name = text;
                            });
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Insira um dado!";
                            }
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.chat,
                                color: Colors.black,
                              ),
                              labelText: "Adicionar descrição",
                              labelStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25.0),
                          controller: _descricaoController,
                          onChanged: (text) {
                            _metaEdited = true;
                            _editedMeta.descricao = text;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Insira um dado!";
                            }
                          },
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_metaEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar as alterações?"),
              content: Text("As alterações serão descartadas ao sair."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Sim")),
              ],
              elevation: 24.0,
              backgroundColor: Colors.white,
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
