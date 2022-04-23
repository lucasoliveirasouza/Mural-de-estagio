import 'package:flutter/material.dart';
import 'package:mural_estagio/models/usuario.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/usuario_service.dart';
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


    final usuario = UsuarioService().getFindById(widget.vaga.idEmpresa);

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
              FutureBuilder(
                future: usuario,
                builder:
                    (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text("Endereço: " + snapshot.data?.endereco),
                    );

                  } else {
                    return Container(

                    );
                  }
                },
              ),
              FutureBuilder(
                future: usuario,
                builder:
                    (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text("Email: " + snapshot.data?.email),
                    );

                  } else {
                    return Container(

                    );
                  }
                },
              ),
              ListTile(
                title: Text("Descrição: " + widget.vaga.descricaoVaga),
              ),
              ListTile(
                title:
                    Text("Remuneração: " + widget.vaga.remuneracao.toString()),
              ),
              ListTile(
                title: Text(
                    "Horas semanais: " + widget.vaga.horasSemanais.toString()),
              ),
              BotaoPadrao(
                titulo: "Candidatar",
                onTap: () {

                },
              ),
            ],
          )),
    );
  }
}
