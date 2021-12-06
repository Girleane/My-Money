import 'package:flutter/material.dart';
import 'package:meta_old_sdk/ui/side_menu.dart';

class FakeHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.iceMoney, //This will change the drawer background to blue.
          //other styles
        ),
        child: SideMenu(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueMoney,
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('HomePage Falsa para implementar o SideMenu'),
      ),
    );
  }
}