import 'package:flutter/material.dart';
import 'package:meta_old_sdk/ui/metas_home_page.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'My Money',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.iceMoney,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/myMoney.png'))),
          ),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MetasHomePage();
                    },
                  ),
                );
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
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Encerrar sessão'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text('Sobre'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}