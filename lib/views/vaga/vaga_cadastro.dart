import 'package:flutter/material.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';

class VagaCadastroView extends StatefulWidget {
  const VagaCadastroView({Key? key}) : super(key: key);

  @override
  _VagaCadastroViewState createState() => _VagaCadastroViewState();
}

class _VagaCadastroViewState extends State<VagaCadastroView> {
  final descricao = TextEditingController();
  final remuneracao = TextEditingController();
  final horasSemanais = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar vaga"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [

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
          ],
        ),
      ),
    );
  }
}
