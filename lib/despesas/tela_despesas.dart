import 'package:my_money_integrated/grafico/tela_grafico.dart';
import 'package:my_money_integrated/despesas/total_despesas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_money_integrated/helpers/despesas_helper.dart';
import 'add_despesas.dart';

class TelaDespesas extends StatefulWidget {
  const TelaDespesas({Key? key}) : super(key: key);

  @override
  _TelaDespesasState createState() => _TelaDespesasState();
}

class _TelaDespesasState extends State<TelaDespesas> {
  DespesaHelper helper = DespesaHelper();
  List<Despesa> despesa = [];
  var dataAtual = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');
  var formatterCalendar = DateFormat('MM/yyyy');

  var total;
  DateTime? focusedDate;
  String? saldoAtual;
  String? dataFormatada;

  @override
  void initState() {
    super.initState();
    //_getAllDespesas();
    setState(() {
      despesa.clear();
      dataFormatada = formatterCalendar.format(dataAtual);
      _allDespMes(dataFormatada!);
    });
    //helper.deleteDespesa(5);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //_allDespMes(dataFormatada!);
    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Grafico()));
              },
              icon: Icon(
                Icons.bar_chart,
                size: 30,
                color: Colors.white,
              ))
        ],
        toolbarHeight: height * 0.1,
      ),
      body: Stack(
        //fit: StackFit.expand,
        children: [
          TableCalendar(
            lastDay: DateTime.utc(2030, 10, 26),
            focusedDay: dataAtual,
            firstDay: DateTime.utc(2020, 10, 26),
            locale: 'pt_BR',
            headerStyle: HeaderStyle(
              formatButtonShowsNext: false,
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontSize: 20.0,
              ),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.transparent),
              weekendStyle: TextStyle(color: Colors.transparent),
            ),
            rowHeight: 0,
            calendarFormat: CalendarFormat.month,
            onPageChanged: (dateFirst) {
              setState(() {
                print(dateFirst);
                dataAtual = dateFirst;
                despesa.clear();
                dataFormatada = formatterCalendar.format(dateFirst);
                _allDespMes(dataFormatada!);
                if (despesa.isEmpty) {
                  total = 0;
                }
                print("DATA FORMATADA CALENDAR $dataFormatada");
              });
            },
            onFormatChanged: (format) {},
            onDaySelected: (dateFirst, dateLast) {
              setState(() {
                print(dateFirst);
                dataFormatada = formatterCalendar.format(dateFirst);
                _allDespMes(dataFormatada!);

                print("DATA FORMATADA CALENDAR $dataFormatada");
              });
            },
          ),
          _listSheet(saldoAtual, despesa),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showAddDespesaPage();
          despesa.clear();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void showAddDespesaPage({Despesa? despesa}) async {
    final recDesp = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddDespesas(
                  despesa: despesa,
                )));
    if (recDesp != null) {
      if (despesa != null) {
        await helper.updateDespesa(recDesp);
      } else {
        await helper.saveDespesa(recDesp);
      }
      _allDespMes(formatterCalendar.format(dataAtual));
    }
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _allDespMes(String data) {
    helper.getDespesasPorMes(data).then((list) {
      List<Despesa> despesaA = [];
      int x = 0;
      if (list.isNotEmpty) {
        setState(() {
          despesaA = list as List<Despesa>;
          for (int i = 0; i < despesaA.length; i++) {
            if (despesaA[i].tipo == "d") {
              if (despesa.isNotEmpty) {
                if (despesaA[i] == despesa[x]) {
                  x++;
                  continue;
                }
              }
              despesa.add(despesaA[i]);
              x = 0;
            }
          }
          total = despesa.map((item) {
            double correctValue = item.value;
            return correctValue;
          }).reduce((a, b) => a + b);
          saldoAtual = total.toString();
          print(list);
        });
      } else if (despesa.isEmpty) {
        setState(() {
          despesa.clear();
          total = 0;
          saldoAtual = total.toString();
          print(list);
        });
      } else {
        setState(() {
          despesa.clear();
          total = 0;
          saldoAtual = total.toString();
          print(list);
        });
      }
    });
  }

  Widget _listSheet(saldoAtual, despesa) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 1,
        builder: (context, controller) => ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              child: Container(
                color: Color(0xFFC4C9EB),
                child: Stack(children: [
                  TotalDespesas(saldoAtual),
                  Container(
                    padding: EdgeInsets.only(top: 75, left: 10, right: 10),
                    child: ListView.builder(
                        itemCount: despesa.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _showOptions(context, index);
                              //_allDespMes(formatterCalendar.format(dataAtual));
                              //despesa.clear();
                            },
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.account_balance_wallet_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xFFCF2323),
                                  ),
                                  Spacer(
                                    flex: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        despesa[index].title,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        despesa[index].subtitle,
                                        style: TextStyle(
                                            fontSize: 12.5,
                                            color: Colors.black,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 100,
                                  ),
                                  Text(
                                    '${despesa[index].value}',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ]),
              ),
            ));
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(onClosing: () {
          //despesa.clear();
        }, builder: (context) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      helper.deleteDespesa(despesa[index].id!);
                      despesa.clear();
                      _allDespMes(formatterCalendar.format(dataAtual));
                    },
                    child: Text(
                      "Excluir",
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showAddDespesaPage(despesa: despesa[index]);
                      despesa.clear();
                    },
                    child: Text("Editar")),
              ],
            ),
          );
        });
      },
    );
  }
}
