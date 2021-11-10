import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/Lista_Despesas.dart';
import 'package:mymoney_test_1/ui/tela_despesas_top.dart';

import 'add_despesas.dart';

class TelaDespesas extends StatefulWidget {
  const TelaDespesas({Key? key}) : super(key: key);

  @override
  _TelaDespesasState createState() => _TelaDespesasState();
}

class _TelaDespesasState extends State<TelaDespesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          TelaDespesasTop(),
          SizedBox(
            height: MediaQuery.of(context).size.height*1.2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Color(0xFFC4C9EB),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                    //bottomRight: const Radius.circular(40.0),
                    //bottomLeft: const Radius.circular(40.0),
                  )),
              child: ListaDepesas()),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(
          Icons.add,
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDespesas())
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
