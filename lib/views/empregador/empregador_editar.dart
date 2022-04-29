import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/models/empregador.dart';
import 'package:mural_estagio/services/empregador_service.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';

class EmpregadorEditarView extends StatefulWidget {
  const EmpregadorEditarView({Key? key}) : super(key: key);

  @override
  _EmpregadorEditarViewState createState() => _EmpregadorEditarViewState();
}

class _EmpregadorEditarViewState extends State<EmpregadorEditarView> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final nome = TextEditingController();
  final email = TextEditingController();
  final endereco = TextEditingController();
  final telefone = TextEditingController();
  String id = "";

  @override
  Widget build(BuildContext context) {
    EmpregadorService()
        .getEmpregador(auth.currentUser!.email.toString())
        .then((value) {
      nome.text = value?.nome ?? "";
      email.text = value?.email ?? "";
      endereco.text = value?.endereco ?? "";
      telefone.text = value?.telefone ?? "";
      id = value?.id ?? "";
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar empregador"),
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
                Empregador empregador = Empregador(id, nome.text, "", "", "",
                    endereco.text, telefone.text, "");

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(EmpregadorService()
                        .editarEmpregador(empregador)
                        .toString())));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
