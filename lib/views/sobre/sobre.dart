import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/services/estudante_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/views/curriculo/curriculo_editar.dart';

class SobreView extends StatefulWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  _SobreViewState createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final usuario =
        UsuarioService().getUser(auth.currentUser!.email.toString());

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
                child: FutureBuilder(
                  future: usuario,
                  builder:
                      (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data?.nome ?? "",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    } else {
                      return Text(
                        "",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Informações gerais"),
              subtitle: Text("Visualizar e editar informações gerais"),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Currículo"),
              subtitle: Text("Visualizar e editar currículo"),
              onTap: () {
                EstudanteService().getEstudante(auth.currentUser!.email.toString()).then((value){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurriculoEditarView(estudante: value,)));
                });

              },
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
