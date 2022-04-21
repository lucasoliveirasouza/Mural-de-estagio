import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/services/vaga_service.dart';
import 'package:mural_estagio/views/vaga/vaga_lista.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';

class VagaCadastroView extends StatefulWidget {
  const VagaCadastroView({Key? key}) : super(key: key);

  @override
  _VagaCadastroViewState createState() => _VagaCadastroViewState();
}

class _VagaCadastroViewState extends State<VagaCadastroView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String idUsuario = "";
  String nomeUsuario = "";
  final descricao = TextEditingController();
  final remuneracao = TextEditingController();
  final horasSemanais = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usuario =
        UsuarioService().getUser(auth.currentUser!.email.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar vaga"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Center(
              child: FutureBuilder(
                future: usuario,
                builder:
                    (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
                  if (snapshot.hasData) {
                    idUsuario = snapshot.data?.id ?? "";
                    nomeUsuario = snapshot.data?.nome ?? "";
                    return Text(
                      "",
                    );
                  } else {
                    return Text(
                      "",
                    );
                  }
                },
              ),
            ),

            TextFormField(
              maxLines: 6,
              controller: descricao,
              decoration: InputDecoration(
                labelText: "Descrição da vaga",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    new Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FormFieldPadrao(
              controle: remuneracao,
              title: "Remuneração",
            ),
            SizedBox(
              height: 10,
            ),
            FormFieldPadrao(
              controle: horasSemanais,
              title: "Quantidade de horas semanais",
            ),
            SizedBox(
              height: 25,
            ),
            BotaoPadrao(
              titulo: "Cadastrar",
              onTap: () {
                Vaga vaga = Vaga(
                    idUsuario,
                    nomeUsuario,
                    descricao.text,
                    double.parse(remuneracao.text),
                    int.parse(horasSemanais.text));
                VagaService().cadastrarVaga(vaga);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Vaga cadastrada!")));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
