import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/ListData.dart';

class ListaDepesas extends StatefulWidget {
  const ListaDepesas({Key? key}) : super(key: key);

  @override
  _ListaDepesasState createState() => _ListaDepesasState();
}

class _ListaDepesasState extends State<ListaDepesas> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: ListTile(
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
                '350,00',
                style: TextStyle(
                    color: Color(0xFFCF2323),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.black,
            thickness: 1.0,
            indent: 15.0,
            endIndent: 15.0,
          ),
      ListData(
          'Alimentação',
          Icon(
            Icons.account_balance_wallet_rounded,
            size: 30,
            color: Colors.white,
          ),
          '09/11/2021',
          350),
    ]);
  }
}
