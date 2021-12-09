import 'package:flutter/material.dart';

class TotalReceitas extends StatefulWidget {
  final saldoTotal;

  TotalReceitas(this.saldoTotal);

  @override
  _TotalReceitasState createState() => _TotalReceitasState();
}

class _TotalReceitasState extends State<TotalReceitas> {
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
              'R\$ ${widget.saldoTotal}',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFF3BA718),
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
