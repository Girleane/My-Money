import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/month_view.dart';
import 'package:mymoney_test_1/ui/tela_despesas_top.dart';

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
        child: Column(
          children: [
            TelaDespesasTop(),
            MonthView(),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFFC4C9EB),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        //bottomRight: const Radius.circular(40.0),
                        //bottomLeft: const Radius.circular(40.0),
                      )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                        height: 80,
                        width: 395,
                        color: Colors.transparent,
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0),
                              )),
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
                              style:
                                  TextStyle(color: Color(0xFFCF2323), fontSize: 30.0,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 5.0,
                        color: Colors.black,
                        thickness: 1.0,
                        indent: 15.0,
                        endIndent: 15.0,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(Icons.add,),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
