import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/month_view.dart';

class TelaDespesasTop extends StatelessWidget {
  const TelaDespesasTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        /*padding: EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 10.0),*/
      height: MediaQuery.of(context).size.height*0.2,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              MonthView(),
            ],
          ),
        ));
  }
}
