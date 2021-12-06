import 'package:flutter/material.dart';
import 'package:meta_old_sdk/ui/fake_home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.9,
              ],
              colors: [
                Colors.blueMoney,
                Colors.pinkMoney,
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 350.0,
              height: 350.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/myMoneyD.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FakeHomePage()));
    });
  }
}
