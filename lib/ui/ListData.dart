import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  late final String title;
  late final String subtitle;
  late final Icon icon;
  late final dynamic value;

  ListData(this.title, this.icon, this.subtitle, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width*0.1,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          //top: BorderSide(color: Colors.grey, width: 1.0),
          bottom: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            child: icon,
            backgroundColor: Color(0xFFCF2323),
          ),
          Spacer(flex: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Spacer(flex: 100,),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
