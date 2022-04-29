import 'package:flutter/material.dart';
import 'package:mural_estagio/services/estudante_service.dart';
import 'package:mural_estagio/services/usuario_service.dart';

class InteresseListaView extends StatefulWidget {
  const InteresseListaView({Key? key}) : super(key: key);

  @override
  _InteresseListaViewState createState() => _InteresseListaViewState();
}

class _InteresseListaViewState extends State<InteresseListaView> {
  @override
  Widget build(BuildContext context) {
    Future<List<String?>?> futureList = EstudanteService().getVagas();

    if (UsuarioService().getUsuario()?.funcao == "Estudante") {
      return Scaffold(
        appBar: AppBar(
          title: Text("Interesses"),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
              future: futureList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<String?>?> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]!.toString()),
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
