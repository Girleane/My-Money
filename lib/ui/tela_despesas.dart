import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymoney_test_1/ui/Lista_Despesas.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mymoney_test_1/helpers/despesas_helper.dart';
import 'add_despesas.dart';


class TelaDespesas extends StatefulWidget {

  const TelaDespesas({Key? key}) : super(key: key);

  @override
  _TelaDespesasState createState() => _TelaDespesasState();
}

class _TelaDespesasState extends State<TelaDespesas> {

  DespesaHelper helper = DespesaHelper();

  var dataAtual = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');
  var formatterCalendar = DateFormat('MM/yyyy');

  var total;
  DateTime? focusedDate;
  String? saldoAtual;
  String? dataFormatada;

  List<Despesa> despesa = [];

  @override
  void initState() {
    super.initState();
    //_getAllDespesas();
    setState(() {
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
          onPressed: () {},
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
              onPressed: () {},
              icon: Icon(
                Icons.search,
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
              titleTextStyle: TextStyle(color: Colors.white,fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  fontSize: 20.0,
                  ),
              leftChevronIcon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              rightChevronIcon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ),
            calendarStyle: CalendarStyle(outsideDaysVisible: false,),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.transparent),
              weekendStyle: TextStyle(color: Colors.transparent),
            ),
            rowHeight: 0,
            calendarFormat: CalendarFormat.month,
            onPageChanged: (dateFirst){
              setState(() {
                print(dateFirst);
                dataAtual = dateFirst;
                dataFormatada = formatterCalendar.format(dateFirst);
                _allDespMes(dataFormatada!);
                print("DATA FORMATADA CALENDAR $dataFormatada");
              });
            },
            onFormatChanged: (format){

            },
            onDaySelected: (dateFirst, dateLast){
              setState(() {
                print(dateFirst);
                dataFormatada = formatterCalendar.format(dateFirst);
                _allDespMes(dataFormatada!);

                print("DATA FORMATADA CALENDAR $dataFormatada");
              });
            },
          ),
              ListaDepesas(despesa,saldoAtual)
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
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void showAddDespesaPage() async {
    final recDesp = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddDespesas()));
    if(recDesp != null){
      await helper.saveDespesa(recDesp);
      _getAllDespesas();
    }
  }

  void _getAllDespesas(){
    helper.getAllDespesas().then((list){
      print(list);
      setState(() {
        despesa = list as List<Despesa>;
      });
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _allDespMes(String data) {
    helper.getDespesasPorMes(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          despesa = list as List<Despesa>;
          total =
              despesa.map((item) {
                double correctValue = double.parse(item.value);
                return correctValue;
              }).reduce((a, b) => a + b);
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

      //print("TOTAL: $total");
      //print("All MovMES: $listmovimentacoes");
    });
  }

}
