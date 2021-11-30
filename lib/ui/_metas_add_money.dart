import 'package:flutter/material.dart';
import 'package:meta_old_sdk/helpers/meta_helper.dart';
import 'package:meta_old_sdk/ui/metas_home_page.dart';

class MetasAddMoney extends StatefulWidget {
  final Meta meta;

  MetasAddMoney({this.meta});

  @override
  _MetaAddMoneyState createState() => _MetaAddMoneyState();
}

class _MetaAddMoneyState extends State<MetasAddMoney> {
  bool _metaEdited = false;
  Meta _editedMeta;

  /*Controladores de texto utilizados para editar e
  * resetar compos de texto*/
  TextEditingController _valorMetaController = TextEditingController();
  TextEditingController _valorInicialController = TextEditingController();
  TextEditingController _doneController = TextEditingController();

  final _valorInicialFocus = FocusNode();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    _valorInicialController.text = "";
    _doneController.text = "";
    setState(() {
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
      _doneController.text = _editedMeta.done;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Dinheiro"),
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Show Snackbar',
              onPressed: _resetFields,
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editedMeta.name != null && _editedMeta.valorInicial.isNotEmpty) {
            Navigator.pop(context, _editedMeta);
          } else {
            FocusScope.of(context).requestFocus(_valorInicialFocus);

          }
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.pinkMoney,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.blueMoney,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.iceMoney,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
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
                              labelText: "Quanto deseja adicionar?",
                              labelStyle: TextStyle(color: Colors.black)),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.deepPurple, fontSize: 25.0),
                          controller: _valorInicialController,
                          focusNode: _valorInicialFocus,
                          onChanged: (text) {
                            _metaEdited = true;
                            double init = double.parse(widget.meta.valorInicial);
                            double total = init + double.parse(text);
                            setState(() {
                              _editedMeta.valorInicial =  total.toStringAsFixed(0);
                              _metaFinished();
                            });
                          },
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100.0, 30.0, 100.0, 50.0),
                child: Column(
                  children: [
                    Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("images/myMoney.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Invista no seu futuro!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontFamily: 'lilitaOne',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* Atribui uma "etiqueta/label" a meta no banco de dados definido-a como
  * concluida ou não concluida*/
  String _metaFinished(){
    if(double.parse(_editedMeta.valorInicial) >= double.parse(widget.meta.valorMeta)) {
      _editedMeta.done = "ok";
    }
    else{
      _editedMeta.done = "NotOk";
    }
    return _editedMeta.done;
  }

}
