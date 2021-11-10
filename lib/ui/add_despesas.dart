import 'package:flutter/material.dart';
import 'package:mymoney_test_1/ui/add_despesas_top.dart';

class AddDespesas extends StatefulWidget {
  const AddDespesas({Key? key}) : super(key: key);

  @override
  _AddDespesasState createState() => _AddDespesasState();
}

class _AddDespesasState extends State<AddDespesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF33429F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          AddDespesasTop(),
          Container(
            height: MediaQuery.of(context).size.height*0.80,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
                color: Color(0xFFC4C9EB),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: CircleAvatar(child: Icon(Icons.attach_money_sharp,color: Color(0xFFC4C9EB),),backgroundColor: Colors.black,radius: 18,),
                      labelText: "Valor da Despesa",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple,fontSize: 25.0),
                    ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_time_outlined,color: Colors.black,size: 37,),
                      labelText: "Data",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurple,fontSize: 25.0),),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.menu,color: Colors.black,size: 37,),
                      labelText: "Categoria",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurple,fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(Icons.chat,color: Colors.black,size: 37,),
                      labelText: "Adicionar descrição",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.5,
                        fontSize: 26.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.deepPurple,fontSize: 25.0),
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 1,
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFCF2323),
        elevation: 6,
        child: Icon(
          Icons.check,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
