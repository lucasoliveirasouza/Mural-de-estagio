import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/estudante_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';
import 'package:mural_estagio/util/constantes.dart';


class InteresseListaView extends StatefulWidget {
  const InteresseListaView({Key? key}) : super(key: key);

  @override
  _InteresseListaViewState createState() => _InteresseListaViewState();
}

class _InteresseListaViewState extends State<InteresseListaView> {
  @override
  Widget build(BuildContext context) {
    Future<List<Vaga?>?> futureList = EstudanteService().getVagas();

    if (UsuarioService().getUsuario()?.funcao == "Estudante") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Interesses"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: futureList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Vaga?>?> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: corPadrao.shade50,
                      child: ListTile(
                        title: Text("Cursos: " + snapshot.data![index]!.cursos),
                        subtitle: Text("Ofertada por " + snapshot.data![index]!.nomeEmpresa),
                        trailing: Text("RS " + snapshot.data![index]!.remuneracao.toString()),
                      ),
                    );
                  }),
                );
              }),
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
