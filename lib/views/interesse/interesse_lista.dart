import 'package:flutter/material.dart';
import 'package:mural_estagio/services/usuario_service.dart';

class InteresseListaView extends StatefulWidget {
  const InteresseListaView({Key? key}) : super(key: key);

  @override
  _InteresseListaViewState createState() => _InteresseListaViewState();
}

class _InteresseListaViewState extends State<InteresseListaView> {
  @override
  Widget build(BuildContext context) {
    if (UsuarioService().getUsuario()?.funcao == "Estudante") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Interesses"),
        ),
        body: Container(
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Interessados"),
        ),
      );
    }
  }
}
