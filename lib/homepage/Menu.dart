import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/InicialPage.dart';
import 'package:my_money_integrated/metas/MetasHomePage.dart';
import 'package:my_money_integrated/perfil/MeuPerfil.dart';
import 'package:my_money_integrated/sobre/SobrePage.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.dashboard_rounded),
            title: Text('Início'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text('Gráficos'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: Icon(Icons.check_box_rounded),
              title: Text('Metas'),
              onTap: () =>
              {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MetasHomePage();
                    }))
              }),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Receitas'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.remove_circle_rounded),
            title: Text('Despesas'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Dicas'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: Text('Meu perfil'),
              onTap: () =>
              {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MeuPerfil();
                    }))
              }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Encerrar sessão'),
            onTap: () =>
            {Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return InicialPage();
                }))
            },
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text('Sobre'),
            onTap: () => {Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return SobrePage();
                }))}
          ),
        ],
      ),
    );
  }
}
