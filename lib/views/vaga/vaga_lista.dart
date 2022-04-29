import 'package:flutter/material.dart';
import 'package:mural_estagio/models/vaga.dart';
import 'package:mural_estagio/services/vaga_service.dart';
import 'package:mural_estagio/util/constantes.dart';
import 'package:mural_estagio/views/vaga/vaga.dart';
import 'package:mural_estagio/views/vaga/vaga_cadastro.dart';

class VagaListaView extends StatefulWidget {
  const VagaListaView({Key? key}) : super(key: key);

  @override
  _VagaListaViewState createState() => _VagaListaViewState();
}

class _VagaListaViewState extends State<VagaListaView> {
  @override
  Widget build(BuildContext context) {
    Future<List<Vaga?>?> futureList = VagaService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de vagas"),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 40, left: 40, top: 15),
        child: FutureBuilder(
            future: futureList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Vaga?>?> snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VagaView(vaga: snapshot.data![index]!)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: corPadrao.shade50,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(children: [
                            SizedBox(
                                width: 60,
                                height: 60,
                                child:
                                    Image.asset("assets/images/diplomado.png")),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                snapshot.data![index]!.cursos,
                                style: TextStyle(
                                    fontSize: 21,
                                    color: corPadrao,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                "Remuneração: " +
                                    snapshot.data![index]!.remuneracao
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: corPadrao,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Local: " + snapshot.data![index]!.local,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: corPadrao,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Turno: " + snapshot.data![index]!.periodo,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: corPadrao,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Center(
                              child: Text(
                                "VER MAIS",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: corPadrao,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                }),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VagaCadastroView(),
            ),
          );
        },
      ),
    );
  }
}
