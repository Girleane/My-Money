import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';
import 'package:my_money_integrated/despesas/tela_despesas.dart';
import 'package:my_money_integrated/grafico/tela_grafico.dart';
import 'package:my_money_integrated/helpers/despesas_helper.dart';
import 'package:my_money_integrated/metas/MetasAddMoney.dart';
import 'package:my_money_integrated/metas/MetasHomePage.dart';
import 'package:my_money_integrated/metas/helpers/MetasHelpers.dart';
import 'package:my_money_integrated/perfil/MeuPerfil.dart';
import 'package:my_money_integrated/receitas/tela_receitas.dart';
import 'package:my_money_integrated/sobre/SobrePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isVisible = true;
  String? SaldoTotalMeta = '0';
  double total = 0.0;
  String? saldoAtualmov = '0';
  double despSum = 0.0;
  double recSum = 0.0;
  double testeR = 0.0;
  double testeD = 0.0;
  int progRec = 0;
  int progDesp = 0;

  static const Color _primaryColor = Colors.deepPurpleAccent;
  static const Color _secondaryColor = Colors.deepOrangeAccent;
  var constante = 1;
  double totalMeta = 0.0;
  List<Meta> metas = [];
  List<Despesa> mov = [];
  MetaHelper helper = MetaHelper();
  DespesaHelper helperMov = DespesaHelper();

  @override
  void initState() {
    super.initState();
    _getAllMetas();
    _getAllMov();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
          Colors.iceMoney, //This will change the drawer background to blue.
          //other styles
        ),
        child: SafeArea(
          child: Drawer(
            elevation: 5.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.dashboard_rounded),
                  title: Text('Início'),
                  onTap: () =>
                  {
                    Navigator.pop(context),
                    _getAllMetas(),
                    _getAllMov(),
                  },
                ),
                ListTile(
                  leading: Icon(Icons.assessment),
                  title: Text('Gráficos'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Grafico()));
                    _getAllMetas();
                    _getAllMov();
                  },
                ),
                ListTile(
                    leading: Icon(Icons.check_box_rounded),
                    title: Text('Metas'),
                    onTap: () =>
                    {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return MetasHomePage();
                          })),
                      _getAllMetas(),
                      _getAllMov(),
                    }),
                ListTile(
                  leading: Icon(Icons.add_circle),
                  title: Text('Receitas'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TelaReceitas()));
                    _getAllMetas();
                    _getAllMov();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.remove_circle_rounded),
                  title: Text('Despesas'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TelaDespesas()));
                    _getAllMetas();
                    _getAllMov();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text('Dicas'),
                  onTap: () =>
                  {Navigator.of(context).pop(), _getAllMetas(),
                    _getAllMov()},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text('Meu perfil'),
                    onTap: () =>
                    {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return MeuPerfil();
                          })),
                      _getAllMetas(),
                      _getAllMov(),
                    }),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Encerrar sessão'),
                  onTap: () =>
                  {Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return InicialPage();
                      })),
                    _getAllMetas(),
                    _getAllMov(),
                  },
                ),
                ListTile(
                    leading: Icon(Icons.info_rounded),
                    title: Text('Sobre'),
                    onTap: () =>
                    {Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return SobrePage();
                        })),
                      _getAllMetas(),
                      _getAllMov(),
                    }
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Olá, username!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.0,
            )),
      ),
      backgroundColor: Colors.azulMoney,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Saldo Disponível", textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),),
                IconButton(onPressed: () {
                  setState(() {
                    _isVisible == true ? _isVisible = false : _isVisible = true;
                  });
                },
                    icon: Icon(_isVisible == true ? Icons.lock_outline : Icons
                        .lock_open_rounded,
                      color: _isVisible == true ? Colors.white : Colors
                          .deepOrange,))
              ],
            ),
            Visibility(
              visible: _isVisible,
              child: Row(
                children: [
                  SizedBox(width: 20.0,),
                  Text("R\$ ${saldoAtualmov}0",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),),
                ],
              ),

            ),
            _mainBody(),
            /////////////////////////////////////////////////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),),
                color: Colors.iceMoney,
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.45,
              child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TelaReceitas()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.add_circle, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Receitas", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),

                      SizedBox(width: 19.0,),
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TelaDespesas()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.remove_circle_rounded, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Despesas", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),
                    ],
                  ),

                  SizedBox(height: 12.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MetasHomePage()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.check_box_rounded, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Metas", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),

                      SizedBox(width: 19.0,),
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Grafico()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.assessment, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Gráfico", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),
                    ],
                  ),


                  SizedBox(height: 12.0,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TelaReceitas()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.library_books, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Dicas", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),

                      SizedBox(width: 19.0,),
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SobrePage()));
                      }, child: Container(width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.40, height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.085,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0))), child: Row(children: [
                          SizedBox(width: 10,),
                          Icon(Icons.info_rounded, size: 32,
                            color: Colors.azulMoney,),
                          SizedBox(width: 10,),
                          Text("Sobre", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.azulMoney),)
                        ],),),),
                    ],
                  ),

                ],
              ),

            ),

          ],
        ),
      ),
    );
  }

  Container _mainBody() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
          color: Colors.transparent),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        SizedBox(width: 30,),
        Center(
            child: Container(
              child: _reportCell(isSavings: true,
                  title: 'Receita total',
                  deposit: 'R\$${recSum}0',
                  rate: 'R\$${SaldoTotalMeta}0',
                  progress: progRec),
              height: 170,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  color: Colors.white),
            )),
        SizedBox(width: 20,),
        Center(
            child: Container(
              child: _reportCell(isSavings: true,
                  title: 'Despesa total',
                  deposit: 'R\$${despSum}0',
                  rate: 'R\$${SaldoTotalMeta}0',
                  progress: progDesp),
              height: 170,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  color: Colors.white),
            )),
        SizedBox(width: 30,),
      ]),
    );
  }

  Container _reportCell({
    bool? isSavings,
    String? title,
    String? deposit,
    String? rate,
    int? progress,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings! ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? [
          BoxShadow(
            color: _primaryColor.withOpacity(0.7),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ]
            : [
          BoxShadow(
            color: _secondaryColor.withOpacity(0.9),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress! / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title!,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Total',
                    value: deposit!,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Total de Metas',
                    value: rate!,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _reportInnerCell({bool? isSavings, String? title, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title!,
          style: TextStyle(
            color: isSavings! ? _primaryColor.withOpacity(0.5) : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          value!,
          style: TextStyle(
            color: isSavings ? Colors.black87 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _getAllMetas() {
    helper.getAllMetas().then((list) {
      if (list.isNotEmpty) {
        setState(() {
          metas = list as List<Meta>;
          print(list);
          totalMeta = metas.map((item) {
            double correctValue = double.parse(item.valorMeta!);
            return correctValue;
          }).reduce((a, b) => a + b);
          SaldoTotalMeta = totalMeta.toString();
        });
      } else {
        SaldoTotalMeta = '0.0';
      }
    });
  }

  _getAllMov() {
    helperMov.getAllDespesas().then((list) {
      List<Despesa> despAux = [];
      List<Despesa> recAux = [];
      despSum = 0.0;
      recSum = 0.0;
      int x = 0;
      if (list.isNotEmpty) {
        setState(() {
          mov = list as List<Despesa>;
          for (int i = 0; i < mov.length; i++) {
            if (mov[i].tipo == "d") {
              despAux.add(mov[i]);
              despSum += mov[i].value!;
              print(despAux);
            } else if (mov[i].tipo == "r") {
              recAux.add(mov[i]);
              recSum += mov[i].value!;
              print(recAux);
            }
          }

          total = recSum - despSum;
          testeR = ((recSum * 100) / double.parse(SaldoTotalMeta!));
          testeD = ((despSum * 100) / double.parse(SaldoTotalMeta!));
          progRec = testeR.toInt();
          progDesp = testeD.toInt();
          saldoAtualmov = total.toString();
        });
      } else if (mov.isEmpty) {
        setState(() {
          mov.clear();
          total = 0;
          saldoAtualmov = total.toString();
          print(list);
        });
      } else {
        setState(() {
          mov.clear();
          total = 0;
          saldoAtualmov = total.toString();
          print(list);
        });
      }
    });
  }

}


