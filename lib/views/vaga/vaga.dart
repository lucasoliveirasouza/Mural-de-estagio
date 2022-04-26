import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';

class VagaView extends StatefulWidget {
  Vaga vaga;

  VagaView({Key? key, required this.vaga}) : super(key: key);

  @override
  _VagaViewState createState() => _VagaViewState();
}

class _VagaViewState extends State<VagaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da vaga"),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Oportunidade de estágio:",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              ListTile(
                title: Text("Empresa: " + widget.vaga.nomeEmpresa),
              ),
              ListTile(
                title: Text("Cursos: " + widget.vaga.cursos),
              ),
              ListTile(
                title:
                    Text("Remuneração: " + widget.vaga.remuneracao.toString()),
              ),
              ListTile(
                title: Text("Local: " + widget.vaga.local),
              ),
              ListTile(
                title:
                    Text("Escolaridade: " + widget.vaga.requisitoEscolaridade),
              ),
              ListTile(
                title: Text("Turno: " + widget.vaga.periodo),
              ),
              ListTile(
                title: Text("Descrição da vaga: " + widget.vaga.descricaoVaga),
              ),
              ListTile(
                title: Text("Informações adicionais: " +
                    widget.vaga.informacoesAdicionais),
              ),
              SizedBox(
                height: 15,
              ),
              BotaoPadrao(
                titulo: "Candidatar",
                onTap: () {},
              ),
            ],
          )),
    );
  }
}
