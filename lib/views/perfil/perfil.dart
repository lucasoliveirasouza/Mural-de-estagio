import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/services/auth_service.dart';
import 'package:mural_estagio/services/estudante_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/views/curriculo/curriculo_editar.dart';
import 'package:mural_estagio/views/empregador/empregador_editar.dart';
import 'package:mural_estagio/views/estudante/estudante_editar.dart';
import 'package:mural_estagio/views/sobre/sobre.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
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
                  UsuarioService().getUsuario()?.nome.toString() ?? "",
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
              title: Text("Informações gerais"),
              subtitle: Text("Visualizar e editar informações gerais"),
              onTap: () {
                if (UsuarioService().getUsuario()?.funcao.toString() ==
                    "Estudante") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EstudanteEditarView()));
                } else if (UsuarioService().getUsuario()?.funcao.toString() ==
                    "Empregador") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmpregadorEditarView()));
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Currículo"),
              subtitle: Text("Visualizar e editar currículo"),
              onTap: () {
                EstudanteService()
                    .getEstudante(auth.currentUser!.email.toString())
                    .then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurriculoEditarView(
                                estudante: value,
                              )));
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Sobre"),
              subtitle: Text("Visualizar e editar currículo"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SobreView()));
              },
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
