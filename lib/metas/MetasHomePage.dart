import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/homepage/Home.dart';

import 'MetasAddMoney.dart';
import 'MetasAddPage.dart';
import 'helpers/MetasHelpers.dart';

enum OrderOptions { orderaz, orderza }

class MetasHomePage extends StatefulWidget {
  @override
  _MetasHomePageState createState() => _MetasHomePageState();
}

class _MetasHomePageState extends State<MetasHomePage> {

  final List<bool> isSelected = [true, false, false];
  bool isSwitched = false;

  MetaHelper helper = MetaHelper();

  List<Meta> metas = [];

  @override
  void initState() {
    super.initState();

    _getAllMetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.azulMoney,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
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
        backgroundColor: Colors.azulMoney,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  width: 372.0,
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
              Padding(
                padding: EdgeInsets.fromLTRB(1.0,1.0,1.0,1.0),
                child: Container(
                  height: 540,
                  width: 500,
                  child: _decideMainPage(),
                ),
              ),
            ],
          ),
        ));
  }

  /* Esse método define se será mostrada a tela inicial(default), os cards de
  * metas ativas, cards de metas concluidas ou todos o cars de metas. */
  Widget _decideMainPage() {
    if(metas.length > 0 && isSelected[0] == true) {
      return _listViewMetas();
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

  /* Essa é a tela padrão, onde aparece a logo da empresa e mensagem de
  * instrução para criar as mestas. */
  Widget _defaultPage(){
    return Padding(
      padding: EdgeInsets.fromLTRB(60.0, 50.0, 60.0, 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  /* Esses são os butões Todas/Ativas/Alcançadas par selecionar quais metas
  * seram apresentadas. */
  Widget _mainPageButtons() {
    return ToggleButtons(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(17.0, 5.0, 14.0, 2.0),
          child: Text(
            " Todas ",
            style: TextStyle(fontSize: 22.0),
            overflow: TextOverflow.fade,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 13.0, 2.0),
          child: Text(
            " Ativas",
            style: TextStyle(fontSize: 22.0),
            overflow: TextOverflow.fade,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17.0, 5.0, 20.0, 2.0),
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
      fillColor: Colors.black45,
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

  /* Os cards de metas propriamente ditos. Aqui eles foram construidos usando um
  * GestureDetector para possibilitar a edição e exclusão do card ao tocar nele. */
  Widget _metaCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Card(
          shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),)
          ),
          color: Colors.iceMoney,
          elevation: 10.0,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("  ",
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(metas[index].name ?? "",
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold)),
                    ),
                    PopupMenuButton(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.0, 0, 0, 0),
                        child:Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      color: Colors.white,
                      elevation: 20,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black12,
                              width: 2
                          )
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Adicionar Dinheiro"),
                          value: 1,
                        ),
                      ],
                      onSelected: (result){
                        if (result == 1){
                          _showMetasAddMoney(meta: metas[index]);
                        }
                      },
                    ),
                  ],
                ),
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
                  padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("R\$",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Text(metas[index].valorInicial ?? "",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(110.0, 0.0, 0.0, 0.0),
                      ),
                      Text("/R\$", style: TextStyle(fontSize: 18.0)),
                      Expanded(
                        child: Text(metas[index].valorMeta ?? "",
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_toGo(index),
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                  ],
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

  /* Um ListView para visualizar todos os cards de meta em forma de lista*/
  Widget _listViewMetas() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: metas.length,
        itemBuilder: (context, index) {
          return _metaCard(context, index);
        });
  }

  /* Um ListView para visualizar os cards de meta ativas em forma de lista*/
  Widget _listViewMetasNotFinished() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _notFinishedLength(),
        itemBuilder: (context, index) {
          return _metaCard(context, index);
        });
  }

  /* Me retorna o numero de itens a serem mostrados na lista de metas
  * ainda não finalizadas*/
  int _notFinishedLength(){
    int count = 0;
    for (int i = 0; i < metas.length; i++){
      if(metas[i].done == "NotOk"){
        count++;
      }
    }
    return count;
  }

  /* Um ListView para visualizar os cards de meta finalizadas em forma de lista*/
  Widget _listViewMetasFinished() {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _finishedLength(),
        itemBuilder: (context, index) {
          return _metaCard(context,index);
        });
  }

  /* Me retorna o numero de itens a serem mostrados na lista de metas finalizadas*/
  int _finishedLength(){
    int count = 0;
    for (int i = 0; i < metas.length; i++){
      if(metas[i].done == "ok"){
        count++;
      }
    }
    return count;
  }

  /*Aqui são as opções de editar e excluir utilizadas no GestureDetector*/
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
                              helper.deleteMeta(metas[index].id!);
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

  /* Navigator usado para ir até a página de adicionar metas*/
  void _showMetasPage({Meta? meta}) async {
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

  /* Navigator usado para ir até a página de adicionar dinheiro a uma meta*/
  void _showMetasAddMoney({Meta? meta}) async {
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

  /* Cria uma lista com todas as metas presentes no banco de dados*/
  void _getAllMetas() {
    helper.getAllMetas().then((list) {
      setState(() {
        metas = list as List<Meta>;
      });
    });
  }

  /* Função criada para ordenar as metas de a para z ou de z para a */
  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderaz:
        metas.sort((a, b) {
          return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        metas.sort((a, b) {
          return b.name!.toLowerCase().compareTo(a.name!.toLowerCase());
        });
        break;
    }
    setState(() {});
  }

  /* Ordena as metas de finalizadas para não finalizadas*/
  Widget? _orderListFinished() {
    metas.sort((a, b) {
      return b.done!.toLowerCase().compareTo(a.done!.toLowerCase());
    });
    setState(() {});
  }

  /* Ordena as metas de não finalizadas para finalizadas*/
  Widget? _orderListNotFinished() {
    metas.sort((a, b) {
      return a.done!.toLowerCase().compareTo(b.done!.toLowerCase());
    });
    setState(() {});
  }

  /* Retorna um valor em % para avaliar a progressão da meta*/
  String _percente(int index){
    double percente = (double.parse(metas[index].valorInicial.toString()) / double.parse(metas[index].valorMeta.toString()))*100;
    if (percente <= 999.0) {
      return percente.toStringAsFixed(1) + "% ";
    }else{
      return (percente/1000).toStringAsFixed(1) + "k% ";
    }
  }

  /* Retorna o número de dias que faltam para a data de conclusão da meta*/
  String _toGo(int index){
    DateTime today = DateTime.now();

    List <String> data = metas[index].previsao!.split('/');
    int a = int.parse(data[0]);
    int b = int.parse(data[1]);
    int c = int.parse(data[2]);

    DateTime deadLine = DateTime(c, b, a);

    final rest = deadLine.difference(today).inDays;

    return "Restam : " + rest.toString() + " dias";
  }

  /* Retorna um valor a ser utilizado para "prencher a barra de progresso
  * da meta" para avaliar sua progressão*/
  double _progress(int index){
    double percente = (double.parse(metas[index].valorInicial.toString()) / double.parse(metas[index].valorMeta.toString())) * 200;
    if(percente <= 200.0) {
      return percente;
    }else{
      return 200.0;
    }
  }
}