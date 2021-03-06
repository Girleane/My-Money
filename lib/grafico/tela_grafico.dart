import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:my_money_integrated/helpers/despesas_helper.dart';

class User {
  User({required this.tipo_movimentacao, this.valor});

  String tipo_movimentacao;
  dynamic valor;
}

class Grafico extends StatefulWidget {
  final saldoTotal = 0;

  @override
  _GraficoState createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  DespesaHelper helper = DespesaHelper();
  List<Despesa> despesa = [];
  var dataAtual = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');
  var formatterCalendar = DateFormat('MM/yyyy');
  num totalR = 0;
  num totalD = 0;
  DateTime? focusedDate;
  String saldoAtual = '';
  String? dataFormatada;
  num total_gasto = 0.0;

  num getChartData() {
    for (int i = 0; i < despesa.length; i++) {
      total_gasto = total_gasto + despesa[i].value;
    }
    return total_gasto;
  }

  List<User> _chartData = [
    User(
      tipo_movimentacao: 'ganhos',
      valor: 1000,
    ),
    User(
      tipo_movimentacao: 'despesas',
      valor: 0,
    ),
  ];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    setState(() {
      dataFormatada = formatterCalendar.format(dataAtual);
      _allDespMes(dataFormatada!);
      _chartData[1].valor = getChartData();
    });
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gráficos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              letterSpacing: 1.8,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: const Color(0xff33429F),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: const Color(0xffd6daf6),
          ),
          child: Column(
            children: [
              Container(
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xff33429F),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 35.0,
                    left: 35.0,
                    top: 0.0,
                  ),
                  child: TableCalendar(
                    headerVisible: true,
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
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        fontSize: 20.0,
                      ),
                      leftChevronIcon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      rightChevronIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.transparent),
                      weekendStyle: TextStyle(color: Colors.transparent),
                    ),
                    rowHeight: 0.0,
                    daysOfWeekHeight: 0.0,
                    calendarFormat: CalendarFormat.month,
                    onPageChanged: (dateFirst) {
                      setState(() {
                        print(dateFirst);
                        dataAtual = dateFirst;
                        totalD = 0;
                        totalR = 0;
                        total_gasto = 0;
                        dataFormatada = formatterCalendar.format(dateFirst);
                        _allDespMes(dataFormatada!);
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
                ),
              ),

              //Area do Gráfico
              Padding(
                padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Entradas x Saídas'),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      ColumnSeries<User, String>(
                        name: 'Mês',
                        dataSource: _chartData,
                        xValueMapper: (User gdp, _) => gdp.tipo_movimentacao,
                        yValueMapper: (User gdp, _) => gdp.valor,
                        pointColorMapper: (User gdp, _) =>
                            gdp.tipo_movimentacao == 'ganhos'
                                ? const Color(0xff33429F)
                                : Colors.red,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      )
                    ],
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      numberFormat:
                          NumberFormat.simpleCurrency(decimalDigits: 0),
                    ),
                  ),
                ),
              ),

              //Area da Lista
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: ExpansionTile(
                  title: Text(
                    'Detalhes',
                    style: TextStyle(fontSize: 15.0, color: Color(0xff5E5E5E)),
                  ),
                  tilePadding: EdgeInsets.only(bottom: 0.0, left: 240.0),
                  children: <Widget>[
                    Container(
                      height: 230,
                      color: const Color(0xffd6daf6),
                      child: Scrollbar(
                        isAlwaysShown: true,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: ListView.builder(
                              itemCount: despesa.length,
                              itemBuilder: (BuildContext context, int index) {
                                dynamic keys = despesa[index].title!;
                                dynamic values = despesa[index].value!;
                                values = values.toStringAsFixed(2);
                                dynamic percentual = despesa[index].tipo == 'd'
                                    ? (despesa[index].value! * 100) / totalD
                                    : (despesa[index].value! * 100) / totalR;
                                percentual = percentual.toStringAsFixed(2);
                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.account_balance_wallet_rounded,
                                          color: despesa[index].tipo == 'd'
                                              ? Colors.red
                                              : Colors.blue,
                                        ),
                                      ),
                                      title: Text('$keys'),
                                      subtitle: Text("Percentual "),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, bottom: 4.75),
                                            child: Text(
                                              'RS $values',
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 30.0, right: 0.0),
                                            child: Text(
                                              '$percentual%',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blueGrey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 2.0,
                                      thickness: 1.0,
                                      color: Color(0xff33429F),
                                    ),
                                  ],
                                );
                              }),
                        ),
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

  _allDespMes(String data) {
    helper.getDespesasPorMes(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          despesa = list as List<Despesa>;
          for (int i = 0; i < despesa.length; i++) {
            if (despesa[i].tipo == 'r') {
              totalR += despesa[i].value;
            }
            if (despesa[i].tipo == 'd') {
              totalD += despesa[i].value;
            }
          }
          _chartData[0].valor = totalR;
          _chartData[1].valor = totalD;
          total_gasto = totalD;
          print(list);
        });
      } else {
        setState(() {
          despesa.clear();
          totalD = 0;
          totalR = 0;
          _chartData[1].valor = totalD;
          _chartData[0].valor = totalR;
          print(list);
        });
      }
    });
  }
}
