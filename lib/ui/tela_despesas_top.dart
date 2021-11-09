import 'package:flutter/material.dart';

class TelaDespesasTop extends StatelessWidget {
  const TelaDespesasTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
        /*padding: EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 10.0),*/
      height: screenSize.height * 0.13,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back,size: 30.0,),
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                  Text("Despesas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      )),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp,color: Colors.white,size: 30.0,))
                ],
              ),
            ],
          ),
        ));
  }
}
