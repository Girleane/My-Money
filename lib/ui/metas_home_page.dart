import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_old_sdk/helpers/meta_helper.dart';
import 'package:meta_old_sdk/ui/metas_add_page.dart';
import 'package:meta_old_sdk/ui/_metas_add_money.dart';

enum OrderOptions { orderaz, orderza }

class MetasHomePage extends StatefulWidget {
  @override
  _MetasHomePageState createState() => _MetasHomePageState();
}

class _MetasHomePageState extends State<MetasHomePage> {

  final List<bool> isSelected = [false, false, false];

  //List<String> _choices;
  //int _defaultChoiceIndex;

  MetaHelper helper = MetaHelper();

  List<Meta> metas = [];

  bool isSwitched = false;

  @override
  void initState() {
    super.initState();

    //_choices = ['Ativas', 'Paradas', 'Alcançadas'];
    //_defaultChoiceIndex = 0;

    _getAllMetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueMoney,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text('Menu Principal'),
                        ),
                        body: Center(
                          child: Text(
                            'This is the main page',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    },
                  ));
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text('Metas'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Página atualizada')));
              },
            ),
            PopupMenuButton<OrderOptions>(
              icon: Icon(Icons.sort),
              itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                const PopupMenuItem<OrderOptions>(
                  child: Text("Ordenar de A-Z"),
                  value: OrderOptions.orderaz,
                ),
                const PopupMenuItem<OrderOptions>(
                  child: Text("Ordenar de Z-A"),
                  value: OrderOptions.orderza,
                ),
              ],
              onSelected: _orderList,
            ),
          ],
        ),
        backgroundColor: Colors.blueMoney,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMetasPage();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.pinkMoney,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  width: 400.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                      color: Colors.black26,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: _mainPageButtons(),
                ),
              ),
              Container(
                width: 450.0,
                height: 500.0,
                child: _decideMainPage(),
              ),
            ],
          ),
        ));
  }

  Widget _decideMainPage() {
    if(metas.length > 0 && isSelected[0] == true) {
      return Container(
        width: 450.0,
        height: 550.0,
        child: _listViewMetas(),
      );
    }else if (_notFinishedLength() > 0 && isSelected[1] == true) {
      _orderListNotFinished();
      return _listViewMetasNotFinished();
    }else if(_finishedLength() > 0 && isSelected[2] == true){
      _orderListFinished();
      return _listViewMetasFinished();
    }else{
      return _defaultPage();
    }
  }


  Widget _defaultPage(){
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
            "Crie suas metas aqui!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontFamily: 'lilitaOne',
            ),
          ),
          Text(
            "Estabeleça valores para suas metas e acompnahe sua evolução!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _mainPageButtons() {
    return ToggleButtons(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(17.0, 5.0, 15.0, 5.0),
          child: Text(
            " Todas ",
            style: TextStyle(fontSize: 22.0),
            overflow: TextOverflow.fade,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          child: Text(
            " Ativas",
            style: TextStyle(fontSize: 22.0),
            overflow: TextOverflow.fade,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17.0, 5.0, 15.0, 5.0),
          child: Text(
            "Alcançadas",
            style: TextStyle(fontSize: 22.0),
            overflow: TextOverflow.fade,
          ),
        ),
      ],
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      selectedColor: Colors.pinkMoney,
      disabledColor: Colors.white,
      fillColor: Colors.black54,
      borderWidth: 1,
      renderBorder: true,
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
    );
  }

  /*Widget _choiceChips() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
            label: Text(
              _choices[index],
              style: TextStyle(fontSize: 20.0),
            ),
            selected: _defaultChoiceIndex == index,
            selectedColor: Colors.pinkMoney,
            pressElevation: 15.0,
            onSelected: (bool selected) {
              setState(() {
                _defaultChoiceIndex = selected ? index : 1;
              });
            },
            backgroundColor: Colors.blueMoney,
            labelStyle: TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }*/

  Widget _listViewMetasNotFinished() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _notFinishedLength(),
        itemBuilder: (context, index) {
          return _metaCard(context, index);
        });
  }

  int _notFinishedLength(){
    int count = 0;
    for (int i = 0; i < metas.length; i++){
      if(metas[i].done == "NotOk"){
        count++;
      }
    }
    return count;
  }

  int _indexNotFinished(int index){
    metas[index].done == "NotOk" ? index = index : index = -1;
    return index;
  }

  Widget _metaCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.iceMoney,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: metas[index].img != null
                            ? FileImage(File(metas[index].img))
                            : AssetImage("images/myMoney.png")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          //OPÇÃO DE BOTÃO PARAR METAS 1
                          PopupMenuButton(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    265, 0, 0, 0),
                                child:Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              color: Colors.iceMoney,
                              elevation: 20,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pinkMoney,
                                      width: 2
                                  )
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Adicinoar Dinheiro"),
                                  value: 1,

                                ),
                              ],


                            /*********************************************************/
                            onSelected: (result){
                                if (result == 1){
                                  _showMetasAddMoney(meta: metas[index]);
                                }
                            },
                          ),
                          //OPÇÃO DE BOTÃO PARAR METAS 2
                          /*Padding(
                            padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.pinkMoney,
                              activeColor: Colors.pinkMoney,
                            ),
                          ),*/
                        ],
                      ),
                      Text(metas[index].name ?? "",
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: 202.0,
                          height: 18.0,
                          /*color: Colors.pinkMoney,*/
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: _progress(index),
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.pinkMoney,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(150.0, 0.0, 1.0,0.0),
                                    child: Text(
                                      _percente(index),
                                      style: TextStyle(fontSize: 14.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("R\$",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Text(metas[index].valorInicial ?? "",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 10.0, 60, 10.0),
                            ),
                            Text("/R\$", style: TextStyle(fontSize: 18.0)),
                            Text(metas[index].valorMeta ?? "",
                                style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(_toGo(index),
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold)),
                          /*Text(metas[index].previsao ?? "",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold)),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }


  Widget _listViewMetas() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: metas.length,
        itemBuilder: (context, index) {
          return _metaCard(context, index);
        });
  }


  Widget _listViewMetasFinished() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _finishedLength(),
        itemBuilder: (context, index) {
          return _metaCard(context,index);
        });
  }

  int _indexFinished(int index){
    metas[index].done == "ok" ? index = index : index = -1;
    return index;
  }

  int _finishedLength(){
    int count = 0;
    for (int i = 0; i < metas.length; i++){
      if(metas[i].done == "ok"){
        count++;
      }
    }
    return count;
  }

  Widget _metaCardDone(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.iceMoney,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: metas[index].img != null
                            ? FileImage(File(metas[index].img))
                            : AssetImage("images/myMoney.png")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          //OPÇÃO DE BOTÃO PARAR METAS 1
                          PopupMenuButton(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    265, 0, 0, 0),
                                child:Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              color: Colors.iceMoney,
                              elevation: 20,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pinkMoney,
                                      width: 2
                                  )
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Adicionar Dinheiro"),
                                  value: 1,
                                ),
                              ]
                          ),
                          //OPÇÃO DE BOTÃO PARAR METAS 2
                          /*Padding(
                            padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.pinkMoney,
                              activeColor: Colors.pinkMoney,
                            ),
                          ),*/
                        ],
                      ),
                      Text(metas[index].name ?? "",
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: 202.0,
                          height: 18.0,
                          /*color: Colors.pinkMoney,*/
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: _progress(index),
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.pinkMoney,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(150.0, 0.0, 1.0,0.0),
                                    child: Text(
                                      _percente(index),
                                      style: TextStyle(fontSize: 14.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("R\$",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Text(metas[index].valorInicial ?? "",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50, 10.0, 60, 10.0),
                            ),
                            Text("/R\$", style: TextStyle(fontSize: 18.0)),
                            Text(metas[index].valorMeta ?? "",
                                style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(_toGo(index),
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold)),
                          /*Text(metas[index].previsao ?? "",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold)),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }


  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _showMetasPage(meta: metas[index]);
                            },
                            child: Text(
                              "Editar",
                              style: TextStyle(
                                  color: Colors.pinkMoney, fontSize: 20.0),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              helper.deleteMeta(metas[index].id);
                              setState(() {
                                metas.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                            child: Text(
                              "Excluir",
                              style: TextStyle(
                                  color: Colors.pinkMoney, fontSize: 20.0),
                            ),
                          )),
                    ],
                  ),
                );
              });
        });
  }

  void _showMetasPage({Meta meta}) async {
    final recMeta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MetasAddPage(meta: meta)));
    if (recMeta != null) {
      if (meta != null) {
        await helper.updateMeta(recMeta);
      } else {
        await helper.saveMeta(recMeta);
      }
      _getAllMetas();
    }
  }


  void _showMetasAddMoney({Meta meta}) async {
    final recMeta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MetasAddMoney(meta: meta)));
    if (recMeta != null) {
      if (meta != null) {
        await helper.updateMeta(recMeta);
      } else {
        await helper.saveMeta(recMeta);
      }
      _getAllMetas();
    }
  }


  void _getAllMetas() {
    helper.getAllMetas().then((list) {
      setState(() {
        metas = list;
      });
    });
  }

  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderaz:
        metas.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        metas.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  Widget _orderListDefault() {
    metas.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    setState(() {});
  }

  Widget _orderListFinished() {
    metas.sort((a, b) {
      return b.done.toLowerCase().compareTo(a.done.toLowerCase());
    });
    setState(() {});
  }

  Widget _orderListNotFinished() {
    metas.sort((a, b) {
      return a.done.toLowerCase().compareTo(b.done.toLowerCase());
    });
    setState(() {});
  }

  String _percente(int index){
    double percente = (double.parse(metas[index].valorInicial.toString()) / double.parse(metas[index].valorMeta.toString()))*100;
    if (percente <= 999.0) {
      return percente.toStringAsFixed(1) + "% ";
    }else{
      return (percente/1000).toStringAsFixed(1) + "k% ";
    }
  }

  String _toGo(int index){
    DateTime today = DateTime.now();

    List <String> data = metas[index].previsao.split('/');
    int a = int.parse(data[0]);
    int b = int.parse(data[1]);
    int c = int.parse(data[2]);

    DateTime deadLine = DateTime(c, b, a);

    final rest = deadLine.difference(today).inDays;

    return "Restam : " + rest.toString() + " dias";
  }

  double _progress(int index){
    double percente = (double.parse(metas[index].valorInicial.toString()) / double.parse(metas[index].valorMeta.toString())) * 200;
    if(percente <= 200.0) {
      return percente;
    }else{
      return 200.0;
    }
  }
}