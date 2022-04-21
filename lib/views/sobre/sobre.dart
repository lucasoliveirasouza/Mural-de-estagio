import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';

class SobreView extends StatefulWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  _SobreViewState createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  size: 100,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Center(
                child: Text(
                  "Lucas Oliveira",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Informações pessoais"),
              subtitle: Text("Visualizar e editar informações pessoais"),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Currículo"),
              subtitle: Text("Visualizar e editar currículo"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre"),
              subtitle: Text("Visualizar e editar currículo"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: IconButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    AuthService().logout();
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
