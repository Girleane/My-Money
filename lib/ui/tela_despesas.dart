import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaDespesas extends StatefulWidget {
  const TelaDespesas({Key? key}) : super(key: key);

  @override
  _TelaDespesasState createState() => _TelaDespesasState();
}

class _TelaDespesasState extends State<TelaDespesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 1.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                  Text("Despesas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            ),
            Center(
              child: Container(
                //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                height: 80,
                width: 80,
                color: Colors.transparent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Center(child: Text("Janeiro",style: TextStyle(fontSize: 18.0,fontFamily: 'Montserrat',color: Colors.white),),),
                    Center(child: Text("       "),),
                    Center(child: Text("Fevereiro",style: TextStyle(fontSize: 18.0,fontFamily: 'Montserrat',color: Colors.white),),),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                        //bottomRight: const Radius.circular(40.0),
                        //bottomLeft: const Radius.circular(40.0),
                      )),
                  child: Column(
                    children: <Widget>[
                    ],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
