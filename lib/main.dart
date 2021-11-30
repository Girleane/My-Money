import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'pagina_2.dart';

void main() {
  runApp(MaterialApp(
    home: Grafico(),
    debugShowCheckedModeBanner: false,
  ));
}

class User {
  User(this.tipo_movimentacao, this.valor, this.movimentacoes);

  String tipo_movimentacao;
  double valor;
  List<Map<String, double>> movimentacoes;
}

class Grafico extends StatefulWidget {
  const Grafico({Key? key}) : super(key: key);

  @override
  _GraficoState createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  List<Map<String, double>> receitas = [
    {'Janeiro': 1000.0, 'teste1': 1500.0},
    {'Fevereiro': 25560.0, 'teste2': 250.0},
    {'Março': 3504.0, 'teste3': 3450.0},
    {'Abril': 4540.0},
    {'Maio': 5540.0},
    {'junho': 6501.0},
    {'Julho': 750.0},
    {'Agosto': 8150.0},
    {'Setembro': 9520.0},
    {'Outubro': 15050.0},
    {'Novembro': 112550.0},
    {'Dezembro': 1250.0}
  ];
  List<Map<String, double>> gastos = [
    {'Janeiro': 150.0, 'Janeiro2': 300.0},
    {'Fevereiro': 250.0, 'Fevereiro2': 2550.0},
    {'Março': 350.0, 'Março3': 95450.0},
    {'Abril': 4540.0},
    {'Maio': 550.0},
    {'junho': 650.0},
    {'Julho': 750.0},
    {'Agosto': 850.0},
    {'Setembro': 950.0},
    {'Outubro': 1050.0},
    {'Novembro': 1150.0},
    {'Dezembro': 1250.0}
  ];
  dynamic soma_receita = 0.0;
  dynamic soma_gastos = 0.0;

  List<User> getChartData() {
    soma_receita = 0.0;
    soma_gastos = 0.0;
    for (int i = 0; i < receitas[_month].values.length; i++) {
      soma_receita = soma_receita + receitas[_month].values.elementAt(i);
    }
    for (int i = 0; i < gastos[_month].values.length; i++) {
      soma_gastos = soma_gastos + gastos[_month].values.elementAt(i);
    }
    List<User> chartData = [
      User('ganhos', soma_receita, receitas),
      User('despesas', soma_gastos, gastos),
    ];
    return chartData;
  }

  late List<User> _chartData;
  late TooltipBehavior _tooltipBehavior;
  final List<String> months = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ];
  int _month = 0;

  void selectFoward() {
    setState(() {
      _month++;
      _chartData = getChartData();
    });
  }

  void selectBackward() {
    setState(() {
      _month--;
      _chartData = getChartData();
    });
  }

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('graficos'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => pagina()));
            }),
        backgroundColor: const Color(0xff33429F),
        elevation: 0.0,
      ),
      body: Container(
        height: 1000.0,
        decoration: BoxDecoration(
          color: const Color(0xffd6daf6),
        ),
        child: Column(
          children: [
            Container(
              height: 39,
              decoration: BoxDecoration(
                color: const Color(0xff33429F),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 100.0,
                  left: 100.0,
                ),
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          onPressed: _month > 0 ? selectBackward : null,
                          disabledColor: Colors.white30,
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                        ),
                        Container(
                          width: 110.0,
                          child: Center(
                            child: Text(
                              months[_month],
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.0,
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed:
                              _month < months.length - 1 ? selectFoward : null,
                          disabledColor: Colors.white30,
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
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
                    numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
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
                    height: 240,
                    color: const Color(0xffd6daf6),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: ListView.builder(
                            itemCount: receitas[_month].keys.length +
                                gastos[_month].keys.length,
                            itemBuilder: (BuildContext context, int index) {
                              dynamic keys;
                              dynamic values;
                              dynamic percentual;
                              int indicador = 0;
                              if (index + 1 <= receitas[_month].keys.length) {
                                keys = receitas[_month].keys.elementAt(index);
                                values = receitas[_month].values.elementAt(index);
                                percentual = (values * 100) / soma_receita;
                                percentual = percentual.toStringAsFixed(2);
                                values = values.toStringAsFixed(2);
                              } else {
                                indicador = 1;
                                keys = gastos[_month].keys.elementAt(
                                    index - receitas[_month].keys.length);
                                values = gastos[_month].values.elementAt(
                                    index - receitas[_month].keys.length);
                                percentual = (values * 100) / soma_gastos;
                                percentual = percentual.toStringAsFixed(2);
                                values = values.toStringAsFixed(2);
                              }
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      child: Icon(
                                        Icons.account_balance_wallet_rounded,
                                        color: 1 == indicador
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
                                    color:  Color(0xff33429F),
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
    );
  }
}
