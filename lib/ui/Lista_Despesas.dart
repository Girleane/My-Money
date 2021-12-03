//import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney_test_1/helpers/despesas_helper.dart';
import 'package:mymoney_test_1/ui/ListData.dart';
import 'package:mymoney_test_1/ui/total_despesas.dart';
//import 'package:mymoney_test_1/ui/add_despesas.dart';

class ListaDepesas extends StatefulWidget {

  final List<Despesa> despesaList;
  final saldoTotal;

  ListaDepesas(this.despesaList,this.saldoTotal);

  @override
  _ListaDepesasState createState() => _ListaDepesasState();
}

class _ListaDepesasState extends State<ListaDepesas> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 1,
        builder: (context, controller) => ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
          child: Container(
                color: Color(0xFFC4C9EB),
                child: Stack(
                  children: [
                    TotalDespesas(widget.saldoTotal),
                    Container(
                      padding: EdgeInsets.only(top: 75,left: 10,right: 10),
                      child: ListView.builder(
                        itemCount: widget.despesaList.length,
                        controller: controller,
                        itemBuilder: (context, index) {
                          return ListData(
                              widget.despesaList[index].title!,
                              Icon(
                                Icons.account_balance_wallet_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              widget.despesaList[index].subtitle!,
                              widget.despesaList[index].value!);
                        }),
                    ),
                  ]
                ),
              ),
        ));
  }
}
