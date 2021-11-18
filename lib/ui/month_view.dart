import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  const MonthView({Key? key}) : super(key: key);

  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {

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

  void selectFoward(){
    setState(() {
      _month++;
    });
  }

  void selectBackward(){
    setState(() {
      _month--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: _month > 0 ? selectBackward : null,
            disabledColor: Colors.white30,
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          Text(
            months[_month],
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                fontSize: 20.0,
                color: Colors.white),
          ),
          IconButton(
            onPressed: _month < months.length - 1 ? selectFoward : null,
            disabledColor: Colors.white30,
            icon: Icon(Icons.arrow_forward_ios),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
