import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money_integrated/acesso/InicialPage.dart';
import 'package:my_money_integrated/despesas/tela_despesas.dart';
import 'package:my_money_integrated/grafico/tela_grafico.dart';
import 'package:my_money_integrated/metas/MetasHomePage.dart';
import 'package:my_money_integrated/perfil/MeuPerfil.dart';
import 'package:my_money_integrated/receitas/tela_receitas.dart';
import 'package:my_money_integrated/sobre/SobrePage.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.dashboard_rounded),
              title: Text('Início'),
              onTap: () => {
                Navigator.pop(context)
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Gráficos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Grafico()));
              },
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TelaReceitas()));
              },
            ),
            ListTile(
              leading: Icon(Icons.remove_circle_rounded),
              title: Text('Despesas'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TelaDespesas()));
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Dic as'),
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
      ),
    );
  }
}
