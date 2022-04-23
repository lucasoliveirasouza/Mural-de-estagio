import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';

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
        padding: EdgeInsets.all(13),
        child: ListView(
          children: [
            Center(
              child: Text("Oportunidade de estágio:",
              style: TextStyle(
                fontSize: 25,
              ),
              ),
            ),
            ListTile(
              title: Text("Empresa: " + widget.vaga.nomeEmpresa),
            ),
            ListTile(
              title: Text("Descrição: " + widget.vaga.descricaoVaga),
            ),
            ListTile(
              title: Text("Remuneração: " + widget.vaga.remuneracao.toString()),
            ),
            ListTile(
              title: Text("Horas semanais: " + widget.vaga.horasSemanais.toString()),
            ),
          ],
        )
      ),
    );
  }
}
