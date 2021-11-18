import 'package:flutter/material.dart';
//import 'package:mymoney_test_1/ui/ListData.dart';
//import 'package:mymoney_test_1/ui/Lista_Despesas.dart';

class TotalDespesas extends StatefulWidget {

  final List despesaList;

  TotalDespesas(this.despesaList);

  @override
  _TotalDespesasState createState() => _TotalDespesasState();
}

class _TotalDespesasState extends State<TotalDespesas> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.lock_clock_outlined,
              size: 40.0,
              color: Colors.black,
            ),
            title: const Text(
              'Total',
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'R\$12,80',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFFCF2323),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.black,
            thickness: 1.0,
            indent: 10.0,
            endIndent: 10.0,
          )
        ],
      ),
    );
  }
}
