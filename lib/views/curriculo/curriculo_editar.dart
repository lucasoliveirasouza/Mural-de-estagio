import 'package:flutter/material.dart';
import 'package:mural_estagio/models/curriculo.dart';
import 'package:mural_estagio/models/estudante.dart';
import 'package:mural_estagio/services/curriculo_service.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';
import 'package:mural_estagio/widgets/form_field_padrao.dart';

class CurriculoEditarView extends StatefulWidget {
  Estudante? estudante;

  CurriculoEditarView({Key? key, required this.estudante}) : super(key: key);

  @override
  _CurriculoEditarViewState createState() => _CurriculoEditarViewState();
}

class _CurriculoEditarViewState extends State<CurriculoEditarView> {
  final curso = TextEditingController();
  final instituicao = TextEditingController();
  final conhecimentos = TextEditingController();
  final diferenciais = TextEditingController();
  final referencias = TextEditingController();
  String id = "";

  @override
  Widget build(BuildContext context) {
    CurriculoService().getCurriculo(widget.estudante?.email ?? "").then((value){
      curso.text = value?.curso;
      instituicao.text = value?.instituicao;
      conhecimentos.text = value?.conhecimentos;
      diferenciais.text = value?.diferenciais;
      referencias.text = value?.referencias;
      id = value?.id;
      print(id);

    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar currículo"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: curso,
              title: "Curso",
            ),
            SizedBox(
              height: 15,
            ),
            FormFieldPadrao(
              controle: instituicao,
              title: "Instituição de ensino",
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLines: 3,
              controller: conhecimentos,
              decoration: InputDecoration(
                labelText: "Principais conhecimentos",
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
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLines: 3,
              controller: diferenciais,
              decoration: InputDecoration(
                labelText: "Principais diferenciais",
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
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              maxLines: 3,
              controller: referencias,
              decoration: InputDecoration(
                labelText: "Principais referencias",
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
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            BotaoPadrao(
              titulo: "Salvar",
              onTap: () {
                Curriculo curriculo=Curriculo(id, widget.estudante?.email, curso.text, instituicao.text, conhecimentos.text, diferenciais.text, referencias.text);
                CurriculoService().editarCurriculo(curriculo);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Currículo editado!")));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
