import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/services/estudante_service.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';

class EstudanteEditarView extends StatefulWidget {
  const EstudanteEditarView({Key? key}) : super(key: key);

  @override
  _EstudanteEditarViewState createState() => _EstudanteEditarViewState();
}

class _EstudanteEditarViewState extends State<EstudanteEditarView> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final nome = TextEditingController();
  final email = TextEditingController();
  final endereco = TextEditingController();
  final telefone = TextEditingController();
  String id = "";

  @override
  Widget build(BuildContext context) {
    EstudanteService()
        .getEstudante(auth.currentUser!.email.toString())
        .then((value) {
      nome.text = value?.nome ?? "";
      email.text = value?.email ?? "";
      endereco.text = value?.endereco ?? "";
      telefone.text = value?.telefone ?? "";
      id = value?.id ?? "";
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar estudante"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25, right: 10, left: 15),
        child: ListView(
          children: [
            FormFieldPadrao(
              controle: nome,
              title: "Nome",
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: endereco,
              title: "Endereço",
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: telefone,
              title: "Telefone",
            ),
            SizedBox(
              height: 25,
            ),
            BotaoPadrao(
              titulo: "Salvar",
              onTap: () {
                Estudante estudante = Estudante(id, nome.text, "", "", "",
                    endereco.text, telefone.text, "");

                EstudanteService().editarEstudante(estudante);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Informações editadas!")));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
