import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/widgets/botao_padrao.dart';
import 'package:mural_estagio/widgets/linha_tabela.dart';

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
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Oportunidade de estágio:",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              LinhaTabela(
                title: "Empresa:",
                valor: widget.vaga.nomeEmpresa,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Cursos:",
                valor: widget.vaga.cursos,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Remuneração:",
                valor: "RS " + widget.vaga.remuneracao.toString(),
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Local:",
                valor: widget.vaga.local,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Escolaridade:",
                valor: widget.vaga.requisitoEscolaridade,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Escolaridade:",
                valor: widget.vaga.requisitoEscolaridade,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Turno:",
                valor: widget.vaga.periodo,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Descrição da vaga:",
                valor: widget.vaga.descricaoVaga,
              ),
              SizedBox(
                height: 5,
              ),
              LinhaTabela(
                title: "Informações adicionais:",
                valor: widget.vaga.informacoesAdicionais,
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
