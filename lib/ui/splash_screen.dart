import 'package:flutter/material.dart';
import 'package:meta_old_sdk/ui/fake_home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.3,
              0.6,
              0.9,
            ],
            colors: [
              Colors.blueMoney,
              Colors.pinkMoney,
              Colors.blueMoney,
              Colors.pinkMoney,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("images/myMoneyD.png"),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(10.0, 10.0)
                    )
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Gestão simplificada de suas finanças!",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'lilitaOne',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 150)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FakeHomePage()));
    });
  }
}