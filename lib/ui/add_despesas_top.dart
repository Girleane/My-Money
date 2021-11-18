import 'package:flutter/material.dart';

class AddDespesasTop extends StatelessWidget {
  const AddDespesasTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 20.0,top: 18.0,bottom: 20.0),
                alignment: Alignment.centerLeft,
                child: Text("R\$ 300,00",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)
            ),
          ],
        ));
  }
}
