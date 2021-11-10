import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/tela_despesas.dart';

class AddDespesasTop extends StatelessWidget {
  const AddDespesasTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.25,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDespesas()));
                    },
                    icon: Icon(Icons.arrow_back,size: 30.0,),
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                  Text("Adicionar despesa",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.0,top: 18.0,bottom: 10.0),
                  alignment: Alignment.centerLeft,
                  child: Text("R\$ 300,00",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)
              ),
            ],
          ),
        ));
  }
}
