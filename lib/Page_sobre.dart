import 'package:flutter/material.dart';
import 'pagina_2.dart';


void main() {
  runApp(MaterialApp(
    home: Page_sobre(),
    debugShowCheckedModeBanner: false,
  ));
}

class Page_sobre extends StatefulWidget {
  const Page_sobre({Key? key}) : super(key: key);

  @override
  _Page_sobreState createState() => _Page_sobreState();
}

class _Page_sobreState extends State<Page_sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33429F),
        title: Text('Sobre'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => pagina()));
            }),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xffd6daf6),
        ),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:35.0,bottom: 15),
              child: CircleAvatar(
                backgroundColor: Color(0xff33429F),
                radius: 140,
                child: Container(
                  width: 180.0,
                  height:180.0,
                  decoration: BoxDecoration(
                    color: Color(0xff33429F),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/myMoney.png'),
                ),
              ),),
            Padding(
              padding: EdgeInsets.only(top: 25.0,left: 15.0,right: 15.0),
              child: Center(
                child:Container(
                  height: 35.0,
                  width: 200.0,
                  child: Center(child: Text("0.0.0.1",style: TextStyle(fontSize: 25.0),),),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 25.0,left: 15.0,right: 15.0),
              child: Center(
                child:Column(
                  children: [
                    Text('Projeto Desevolvido por:',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text('Caio Varela',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('Girleane Calixto',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text( 'João Alexandre',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('José Edilson',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('Juan Pablo',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('Lucas Mendes',style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('Marcos Vinícius',style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

