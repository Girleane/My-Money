import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';
import 'package:my_money_integrated/homepage/Menu.dart';
import 'package:my_money_integrated/metas/MetasAddMoney.dart';
import 'package:my_money_integrated/metas/helpers/MetasHelpers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isIncome = false;
  bool _isVisible = false;
  String? SaldoTotalMeta;

  static const Color _primaryColor = Colors.deepPurpleAccent;
  static const Color _secondaryColor = Colors.deepOrangeAccent;
  var constante = 1;
  double totalMeta = 0.0;
  List<Meta> metas = [];
  MetaHelper helper = MetaHelper();

  @override
  void initState() {
    super.initState();
    _getAllMetas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.iceMoney, //This will change the drawer background to blue.
          //other styles
        ),
        child: Menu(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Olá, username!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.0,
            )),
      ),
      backgroundColor: Colors.azulMoney,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                SizedBox(width: 20.0,),
                Text("Saldo Disponível",textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontSize: 20.0),),
                IconButton(onPressed: (){_isVisible = false;}, icon: Icon(Icons.lock,color: Colors.white,))
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20.0,),
                Text("R\$ 2.000,00",style: TextStyle(color: Colors.white,fontSize: 20.0),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            _mainBody(),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0),),
                color: Colors.iceMoney,
              ),
              height: MediaQuery.of(context).size.height*0.40,
            ),
          ],
        ),
      ),
    );
  }

  Container _mainBody() {
    return Container(
      height: MediaQuery.of(context).size.height*0.35,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
          color: Colors.transparent),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        SizedBox(width: 30,),
        Center(
            child: Container(
          child: _reportCell(isSavings: true, title: 'Economia mensal', deposit: '\$5,40', rate: '${SaldoTotalMeta}', progress: 50),
          height: 170,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
              color: Colors.white),
        )),
        SizedBox(width: 20,),
        Center(
            child: Container(
              child: _reportCell(isSavings: true, title: 'Gasto mensal', deposit: '\$5,40', rate: 'R\$${SaldoTotalMeta}0', progress: 50),
              height: 170,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                  color: Colors.white),
            )),
        SizedBox(width: 30,),
      ]),
    );
  }

  Container _reportCell({
    bool? isSavings,
    String? title,
    String? deposit,
    String? rate,
    int? progress,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings! ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? [
          BoxShadow(
            color: _primaryColor.withOpacity(0.7),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ]
            : [
          BoxShadow(
            color: _secondaryColor.withOpacity(0.9),
            offset: Offset(0, 8),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress! / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title!,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Total',
                    value: deposit!,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Meta',
                    value: rate!,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _reportInnerCell({bool? isSavings, String? title, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title!,
          style: TextStyle(
            color: isSavings! ? _primaryColor.withOpacity(0.5) : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          value!,
          style: TextStyle(
            color: isSavings ? Colors.black87 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  void _showMetasAddMoney({Meta? meta}) async {
    final recMeta = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MetasAddMoney(meta: meta)));
    if (recMeta != null) {
      if (meta != null) {
        await helper.updateMeta(recMeta);
      } else {
        await helper.saveMeta(recMeta);
      }
      _getAllMetas();
    }
  }

  void _getAllMetas() {
    helper.getAllMetas().then((list) {
      if(list.isNotEmpty){
        setState(() {
          metas = list as List<Meta>;
          print(list);
          totalMeta = metas.map((item) {
            double correctValue = double.parse(item.valorMeta!);
            return correctValue;
          }).reduce((a, b) => a + b);
          SaldoTotalMeta = totalMeta.toString();
        });
      }else {
        SaldoTotalMeta = '0.0';
      }

    });
  }
}


/*




  String _toGo(int index) {
    DateTime today = DateTime.now();

    List<String> data = metas[index].previsao!.split('/');
    int a = int.parse(data[0]);
    int b = int.parse(data[1]);
    int c = int.parse(data[2]);

    DateTime deadLine = DateTime(c, b, a);

    final rest = deadLine.difference(today).inDays;

    return "Restam : " + rest.toString() + " dias";
  }

  String _percente(int index) {
    double percente = (double.parse(metas[index].valorInicial.toString()) /
            double.parse(metas[index].valorMeta.toString())) *
        100;
    if (percente <= 999.0) {
      return percente.toStringAsFixed(1) + "% ";
    } else {
      return (percente / 1000).toStringAsFixed(1) + "k% ";
    }
  }

  double _progress(int index) {
    double percente = (double.parse(metas[index].valorInicial.toString()) /
            double.parse(metas[index].valorMeta.toString())) *
        200;
    if (percente <= 200.0) {
      return percente;
    } else {
      return 200.0;
    }
  }
}
*/
